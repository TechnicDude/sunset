import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:sunsetgardenapp/api/api.dart';
import 'package:sunsetgardenapp/api/apphelper.dart';
import 'package:sunsetgardenapp/api/loginapi.dart';
import 'package:sunsetgardenapp/model/profilemodel.dart';
import 'package:sunsetgardenapp/utils/app_validator.dart';
import 'package:sunsetgardenapp/utils/appbarforall.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';
import 'package:sunsetgardenapp/utils/buttons/button_widget.dart';
import 'package:sunsetgardenapp/utils/dialoghelper.dart';
import 'package:sunsetgardenapp/utils/loaderscreen.dart';
import 'package:sunsetgardenapp/utils/textfileds/textform.dart';

class EditProfile extends StatefulWidget {
  final List<ProfileUserData>? profileuserdata;
  const EditProfile({Key? key, this.profileuserdata}) : super(key: key);
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  //TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    if (widget.profileuserdata!.isNotEmpty) {
      firstnameController.text = widget.profileuserdata![0].firstName ?? '';
      lastnameController.text = widget.profileuserdata![0].lastName ?? '';
      emailController.text = widget.profileuserdata![0].emailAddress ?? '';
      mobileController.text = widget.profileuserdata![0].phoneNumber.toString();
    }
    super.initState();
  }

  Future submitupdate() async {
    if (imagefiles != null) {
      var url = Uri.parse(APIURL.USERPROFILEUPDATE + AppHelper.userid!);
      print(url);

      final request = http.MultipartRequest('PUT', url);
      Map<String, String> headers = {
        "Authorization": 'Bearer ${AppHelper.AUTH_TOKEN_VALUE?.trim()}'
      };
      print(imagefiles!.path);
      request.headers.addAll(headers);
      print(request.headers);

      final file = await http.MultipartFile.fromPath('image', imagefiles!.path);
      request.files.add(file);
      request.fields['first_name'] = firstnameController.text;
      request.fields['last_name'] = lastnameController.text;
      request.fields['phone_number'] = mobileController.text;
      request.fields['email_address'] = emailController.text;

      // request.fields['id'] = MyApp.userid!;
      print(request);
      try {
        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);
        print(response.body);
        var out = jsonDecode(response.body);
        if (out['status'] == "success") {
          DialogHelper.showFlutterToast(strMsg: out['message']);
          Navigator.pop(context);
        }
      } catch (e) {
        print(e);
      }
    } else {
      var data = {
        'first_name': firstnameController.text,
        'last_name': lastnameController.text,
        'phone_number': mobileController.text,
        'email_address': emailController.text,
        //'user_avatar': emailController.text,
      };
      print(data.toString());

      LoginApi registerresponse = LoginApi(data);

      final response = await registerresponse.updateprofile();

      print(response);
      if (response['status'] == "success") {
        DialogHelper.showFlutterToast(strMsg: response['message']);
        Navigator.pop(context);
      }
    }
  }

  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefiles;

  openImages() async {
    try {
      final XFile? image =
          await imgpicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        imagefiles = image;
        setState(() {});
      } else {
        DialogHelper.showFlutterToast(strMsg: 'No image is selected');
      }
    } catch (e) {
      DialogHelper.showFlutterToast(strMsg: 'Error while picking file');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            text: "Edit Profile",
          )),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(2.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 6.5.h,
                      backgroundColor: AppColors.colorgrey.withOpacity(0.3),
                      child: CircleAvatar(
                        radius: 6.h,
                        backgroundColor: AppColors.colorgrey,
                        backgroundImage: imagefiles != null
                            ? FileImage(File(imagefiles!.path))
                            : widget.profileuserdata![0].userAvatar != null
                                ? NetworkImage(APIURL.imageurl +
                                    widget.profileuserdata![0].userAvatar
                                        .toString())
                                : AssetImage(AppImages.profile)
                                    as ImageProvider,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              openImages();
                            },
                            child: CircleAvatar(
                              radius: 2.h,
                              backgroundColor: AppColors.secondrycolors,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "First name",
                                style: AppStyles.onboardtitle
                                    .copyWith(fontSize: 16.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          TextFormScreen(
                            hinttext: "First name",
                            icon: Icons.account_circle,
                            textEditingController: firstnameController,
                            validator: AppValidator.nameValidator,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Last name",
                                style: AppStyles.onboardtitle
                                    .copyWith(fontSize: 16.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          TextFormScreen(
                            hinttext: "Last name",
                            icon: Icons.account_circle,
                            textEditingController: lastnameController,
                            validator: AppValidator.lastnameValidator,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Phone number",
                                style: AppStyles.onboardtitle
                                    .copyWith(fontSize: 16.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          TextFormScreen(
                            hinttext: "Phone number",
                            icon: Icons.phone_android_rounded,
                            textEditingController: mobileController,
                            validator: AppValidator.mobileValidator,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: AppStyles.onboardtitle
                                    .copyWith(fontSize: 16.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          TextFormScreen(
                            hinttext: "Email",
                            icon: Icons.mail,
                            readOnly: true,
                            textEditingController: emailController,
                            validator: AppValidator.emailValidator,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 5.h,
                  ),
                  ButtonWidget(
                    text: "Update",
                    onTap: () {
                      if (isLoading) {
                        return;
                      }
                      update(
                        firstnameController.text,
                        lastnameController.text,
                        emailController.text,
                        mobileController.text,
                      );

                      submitupdate();
                    },
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              ),
            ),
          ),
          if (isLoading)
            Container(
              height: 100.h,
              width: 100.w,
              color: Colors.transparent,
              child: Center(child: LoaderScreen()),
            )
        ],
      ),
    );
  }

  update(firstname, lastname, email, mobile) async {
    setState(() {
      isLoading = true;
    });

    if (_formKey.currentState!.validate()) {
      //  DialogHelper.showFlutterToast(strMsg: "Profile Update Successfully!");
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }
}
