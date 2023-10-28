import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunsetgardenapp/api/apphelper.dart';
import 'package:sunsetgardenapp/api/loginapi.dart';
import 'package:sunsetgardenapp/page_routes/routes.dart';
import 'package:sunsetgardenapp/utils/app_string.dart';
import 'package:sunsetgardenapp/utils/app_validator.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';
import 'package:sunsetgardenapp/utils/buttons/button_widget.dart';
import 'package:sunsetgardenapp/utils/dialoghelper.dart';
import 'package:sunsetgardenapp/utils/loaderscreennew.dart';
import 'package:sunsetgardenapp/utils/mainbar.dart';
import 'package:sunsetgardenapp/utils/mainbarbottom.dart';
import 'package:sunsetgardenapp/utils/textfileds/textform.dart';

class SignupScreenActivity extends StatefulWidget {
  const SignupScreenActivity({super.key});

  @override
  State<SignupScreenActivity> createState() => _SignupScreenActivityState();
}

class _SignupScreenActivityState extends State<SignupScreenActivity> {
  bool isLoading = false;
  bool _obscureText = true;
  bool setvalue = false;
  String error = '';
  bool valuedata = false;
  final _formKey = GlobalKey<FormState>();

  String? selectedValue = "";
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.blackColor),
        backgroundColor: AppColors.colorswhite,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Column(
              children: [
                MainBar(
                  text: "Register Now",
                  //subtext: "Create new account",
                  image: AppImages.applogo,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormScreen(
                        hinttext: "First name",
                        icon: Icons.person_outline_outlined,
                        textEditingController: firstnameController,
                        validator: AppValidator.nameValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: "Last name",
                        icon: Icons.person_outline_outlined,
                        textEditingController: lastnameController,
                        validator: AppValidator.lastnameValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: "Email",
                        icon: Icons.email_outlined,
                        textEditingController: emailController,
                        validator: AppValidator.emailValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: "Mobile number",
                        keyboardType: TextInputType.number,
                        icon: Icons.mobile_friendly,
                        textEditingController: mobileController,
                        validator: AppValidator.mobileValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: "Password",
                        icon: Icons.lock,
                        textEditingController: passwordController,
                        validator: AppValidator.passwordValidator,
                        suffixIcon: true,
                        obscure: _obscureText,
                        onPressed: _toggle,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: valuedata,
                      onChanged: (value) {
                        setState(() {
                          valuedata = value!;
                        });
                      },
                    ),
                    Row(
                      children: [
                        Text(
                          "I accept the ",
                          style: AppStyles.onboardbody,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Terms and Condition.",
                            style: AppStyles.onboardbody
                                .copyWith(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: Text(
                    error,
                    style: AppStyles.onboardsubtitle
                        .copyWith(color: Colors.red, fontSize: 15.sp),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                ButtonWidget(
                  text: "Signup",
                  onTap: () {
                    if (isLoading) {
                      return;
                    }
                    signup(
                      firstnameController.text,
                      lastnameController.text,
                      emailController.text,
                      mobileController.text,
                      passwordController.text,
                    );
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Aready have an Account? ",
                      style: AppStyles.onboardtitle.copyWith(
                          color: AppColors.colorgrey, fontSize: 16.sp),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Login",
                            style: AppStyles.onboardtitle.copyWith(
                                color: AppColors.primarycolors,
                                fontSize: 16.5.sp),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                    context, Routes.loginScreen);
                              }),
                      ],
                    ),
                  ),
                ),
                MainBarBottom(
                  image: AppImages.bottomimage,
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          )),
          if (isLoading)
            Container(
              height: 100.h,
              width: 100.w,
              color: Colors.transparent,
              child: const Center(child: LoaderScreennew()),
            )
        ],
      ),
    );
  }

  signup(firatname, lastname, email, mobile, password) async {
    setState(() {
      isLoading = true;
    });

    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (valuedata == true) {
        if (_formKey.currentState!.validate()) {
          // if (selectedValue != "") {
          var data = {
            'first_name': firatname.toString().trim(),
            'last_name': lastname.toString().trim(),
            'email_address': email.toString().trim(),
            'phone_number': mobile.toString().trim(),
            'user_password': password.toString().trim(),
            "user_type": selectedValue,
          };
          LoginApi registerresponse = LoginApi(data);
          var response = await registerresponse.register();

          if (response['status'].toString().toLowerCase() == "success") {
            //Languages.of(context)!.otpsend);
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            AppHelper.role = selectedValue.toString();
            sharedPreferences.setString(
                AppStringFile.role, selectedValue.toString());
            //Map<String, dynamic> user = response['data'].toString();
            Navigator.pushNamed(context, Routes.otpVerify, arguments: {
              AppStringFile.pagetype: AppStringFile.signup,
              AppStringFile.email: email,
            });
            setState(() {
              isLoading = false;
            });
            DialogHelper.showFlutterToast(
                strMsg: "OTP send in email"); // response['error'].toString());
            // otp send
          } else {
            DialogHelper.showFlutterToast(strMsg: response['error'].toString());
            setState(() {
              error = response['error'].toString() == "null"
                  ? "something went wrong"
                  : response['error'].toString();
              isLoading = false;

              // error = response['error'].toString();
              // isLoading = false;
            });
          }
          // } else {
          //   AppHelper().dialogBuilder(context, Languages.of(context)!.alter,
          //       Languages.of(context)!.rolemessage);
          //   setState(() {
          //     //  widget.callback!(false);
          //     isLoading = false;
          //   });
          // }

          // DialogHelper.showFlutterToast(strMsg: "Registration Successful");
        } else {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        AppHelper().dialogBuilder(
            context, "Alert!", "Please accept the termes and condtion");
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
      AppHelper().dialogBuilder(
          context, "No Internet!", "Internet connection not available");
      // DialogHelper().shoppopDialog(context);
    }
  }
}
