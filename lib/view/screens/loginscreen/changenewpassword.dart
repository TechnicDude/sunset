import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/api/apphelper.dart';
import 'package:sunsetgardenapp/api/loginapi.dart';
import 'package:sunsetgardenapp/page_routes/routes.dart';
import 'package:sunsetgardenapp/utils/app_validator.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';
import 'package:sunsetgardenapp/utils/buttons/button_widget.dart';
import 'package:sunsetgardenapp/utils/dialoghelper.dart';
import 'package:sunsetgardenapp/utils/mainbar.dart';
import 'package:sunsetgardenapp/utils/mainbarbottom.dart';
import 'package:sunsetgardenapp/utils/textfileds/textform.dart';

class ChangenewPasswordScreenActivity extends StatefulWidget {
  //final Function callback;
  final String? id;
  final String? password;
  final String? userid;
  final String? pagetype;
  final String? otp;
  final String? email;
  const ChangenewPasswordScreenActivity(
      {super.key,
      // required this.callback,
      this.id,
      this.password,
      this.pagetype,
      this.email,
      this.userid,
      this.otp});

  @override
  State<ChangenewPasswordScreenActivity> createState() =>
      _ChangenewPasswordScreenActivityState();
}

class _ChangenewPasswordScreenActivityState
    extends State<ChangenewPasswordScreenActivity> {
  String error = '';

  final _formKey = GlobalKey<FormState>();
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
        iconTheme: const IconThemeData(color: AppColors.blackColor),
        backgroundColor: AppColors.colorswhite,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: 4.h, bottom: 4.h, left: 5.w, right: 5.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                MainBar(
                  text: "Change New Password",
                  image: AppImages.applogo,
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
                  height: 5.h,
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
                  text: "Continue",
                  onTap: () {
                    setState(() {
                      error = '';
                    });
                    if (isLoading) {
                      return;
                    }

                    resetPassword(newpasswordController.text,
                        confirmnewpasswordController.text);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.h),
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

  resetPassword(String newpassword, String confirmpassword) async {
    setState(() {
      isLoading = true;
      //  widget.callback(true);
    });

    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        if (newpasswordController.text == confirmnewpasswordController.text) {
          var data = {
            'otp': widget.otp.toString().trim(),
            'newPassword': newpassword.toString().trim(),
            'email': widget.email.toString().trim(),
          };
          LoginApi registerresponse = LoginApi(data);
          var response =
              await registerresponse.changenewPassword(); //forgetpassword();
          print(response);
          setState(() {
            isLoading = false;
          });
          if (response['status'].toString() == 'success') {
            setState(() {
              isLoading = false;
            });

            DialogHelper.showFlutterToast(
                strMsg: "Confirm Password and Password not match");
            Navigator.pushReplacementNamed(context, Routes.loginScreen);
          } else {
            DialogHelper.showFlutterToast(strMsg: response['error'].toString());

            setState(() {
              error = response['error'].toString();
              // widget.callback(false);
              isLoading = false;
            });
          }
        } else {
          setState(() {
            error = "Confirm password must be match";
            isLoading = false;
          });

          DialogHelper.showFlutterToast(
              strMsg: "Confirm password must be match");
        }
      } else {
        setState(() {
          isLoading = false;
          // widget.callback(false);
        });
      }
    } else {
      AppHelper().dialogBuilder(
          context, "No Internet!", "Internet connection not available");
      setState(() {
        isLoading = false;
        // widget.callback(false);
      });
    }
  }
}
