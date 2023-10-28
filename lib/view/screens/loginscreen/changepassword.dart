import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/api/apphelper.dart';
import 'package:sunsetgardenapp/api/loginapi.dart';
import 'package:sunsetgardenapp/utils/app_validator.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';
import 'package:sunsetgardenapp/utils/buttons/button_widget.dart';
import 'package:sunsetgardenapp/utils/dialoghelper.dart';
import 'package:sunsetgardenapp/utils/mainbar.dart';
import 'package:sunsetgardenapp/utils/mainbarbottom.dart';
import 'package:sunsetgardenapp/utils/textfileds/textform.dart';

class ChangePasswordScreenActivity extends StatefulWidget {
  final String? id;
  final String? password;
  final String? userid;
  final String? pagetype;

  const ChangePasswordScreenActivity({
    super.key,
    this.id,
    this.password,
    this.pagetype,
    this.userid,
  });

  @override
  State<ChangePasswordScreenActivity> createState() =>
      _ChangePasswordScreenActivityState();
}

class _ChangePasswordScreenActivityState
    extends State<ChangePasswordScreenActivity> {
  String error = '';

  final _formKey = GlobalKey<FormState>();
  TextEditingController currentpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmnewpasswordController = TextEditingController();
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool isLoading = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.blackColor),
        backgroundColor: AppColors.colorswhite,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 2.h, left: 5.w, right: 5.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                MainBar(
                  text: "Change Password",
                  image: AppImages.applogo,
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFormScreen(
                  textEditingController: currentpasswordController,

                  hinttext: "Current password",
                  // suffixIcon: true,
                  icon: Icons.password,
                  // obscure: _obscureText1,
                  // onPressed: _toggle1,

                  validator: AppValidator.currentpasswordValidator,
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFormScreen(
                  hinttext: "New password",
                  icon: Icons.lock,
                  textEditingController: newpasswordController,
                  validator: AppValidator.passwordValidator,
                  suffixIcon: true,
                  obscure: _obscureText,
                  onPressed: _toggle,
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFormScreen(
                  hinttext: "Confirm new password",
                  icon: Icons.lock,
                  textEditingController: confirmnewpasswordController,
                  validator: AppValidator.passwordValidator,
                  suffixIcon: true,
                  obscure: _obscureText1,
                  onPressed: _toggle1,
                ),
                SizedBox(
                  height: 6.h,
                ),
                Center(
                  child: Text(
                    error,
                    style: AppStyles.onboardsubtitle
                        .copyWith(color: Colors.red, fontSize: 15.sp),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                ButtonWidget(
                  text: "Continue",
                  onTap: () {
                    setState(() {
                      error = '';
                    });
                    if (isLoading) {
                      return;
                    }
                    changePassword(
                        currentpasswordController.text,
                        newpasswordController.text,
                        confirmnewpasswordController.text);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: MainBarBottom(
                    image: AppImages.bottomimage,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  changePassword(String currentpassword, String newpassword,
      String confirmnewpassword) async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        if (newpasswordController.text == confirmnewpasswordController.text) {
          if (currentpasswordController.text != newpasswordController.text) {
            var data = {
              //'id': widget.id,
              'oldPassword': currentpassword.toString().trim(),
              'newPassword': newpassword.toString().trim(),
              'confirmnewpassword': confirmnewpassword.toString().trim()

              // 'email': widget.email,
            };

            LoginApi registerresponse = LoginApi(data);
            var response = await registerresponse.changepassword();
            print(response);
            setState(() {
              isLoading = false;
            });

            if (response['status'].toString() == 'success') {
              setState(() {
                isLoading = false;
              });

              DialogHelper.showFlutterToast(
                  strMsg:
                      response['message']); //"User New password Updated!!");
              // Navigator.pushReplacementNamed(context, Routes.loginScreen);

              Navigator.pop(context);
            } else {
              DialogHelper.showFlutterToast(
                  strMsg:
                      "Current password is incorrect"); // response['error']); //
            }
          } else {
            setState(() {
              error = "Current password & newpassword should not be same";
              isLoading = false;
            });
            DialogHelper.showFlutterToast(
                strMsg: "Current password & newpassword should not be same");
          }
        } else {
          setState(() {
            error = "New password and current password didn't match";
            isLoading = false;
          });

          DialogHelper.showFlutterToast(
              strMsg: "New password and current password didn't match");
        }
      } else {
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
