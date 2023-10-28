import 'dart:developer';
import 'dart:io';

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
import 'package:sunsetgardenapp/view/screens/loginscreen/components/socialloginbuttonsmaill.dart';

class LoginScreenActivity extends StatefulWidget {
  const LoginScreenActivity({super.key});

  @override
  State<LoginScreenActivity> createState() => _LoginScreenActivityState();
}

class _LoginScreenActivityState extends State<LoginScreenActivity> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool isLoading = false;
  bool valuedata = false;

  final _formKey = GlobalKey<FormState>();
  String error = '';

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
                  text: "Login Now",
                  subtext: "Please login to continue use our app",
                  image: AppImages.applogo,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                        hinttext: "Password",
                        icon: Icons.lock,
                        textEditingController: passwordController,
                        validator: AppValidator.passwordValidator,
                        suffixIcon: true,
                        obscure: _obscureText,
                        onPressed: _toggle,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, Routes.forgetPassword);
                    //   },
                    //   child: Text(
                    //     "Forgot Password? ",
                    //     style: AppStyles.onboardtitle.copyWith(
                    //         color: AppColors.colorgreydark, fontSize: 16.sp),
                    //   ),
                    // ),

                    InkWell(
                      onTap: (){
                Navigator.pushNamed(context, Routes.forgetPassword);
              },
                      child: Text(
                        "Forgot Password? ",
                        style: AppStyles.onboardtitle.copyWith(
                            color: AppColors.colorgreydark, fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Center(
                  child: Text(
                    error,
                    style: AppStyles.onboardsubtitle
                        .copyWith(color: Colors.red, fontSize: 15.sp),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                ButtonWidget(
                  text: "Login",
                  onTap: () {
                    if(isLoading){
                      return;
                    }
                    login(emailController.text, passwordController.text);
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Container(
                      height: .2.h,
                      width: 30.w,
                      color: AppColors.colorgrey,
                    ),
                    const Spacer(),
                    Text(
                      "or continue with",
                      style: AppStyles.onboardbody,
                    ),
                    const Spacer(),
                    Container(
                      height: .2.h,
                      width: 30.w,
                      color: AppColors.colorgrey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialLoginscreenbuttonSmallActivity(
                      logoimgname: AppImages.googlelogo,
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    // if (Platform.isIOS)
                    SocialLoginscreenbuttonSmallActivity(
                      logoimgname: AppImages.facebooklogo,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SocialLoginscreenbuttonSmallActivity(
                      logoimgname: AppImages.applelogo,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: RichText(
                      text: TextSpan(
                    text: "Don't have an account? ",
                    style: AppStyles.onboardtitle
                        .copyWith(color: AppColors.colorgrey, fontSize: 16.sp),
                    children: <TextSpan>[
                      TextSpan(
                          text: "Signup",
                          style: AppStyles.onboardtitle.copyWith(
                              color: AppColors.primarycolors,
                              fontSize: 16.5.sp),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, Routes.signupscreen);
                            }),
                    ],
                  )),
                ),
                MainBarBottom(
                  image: AppImages.bottomimage,
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

  login(email, password) async {
    setState(() {
      isLoading = true;
    });

    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        var data = {
          "email": emailController.text.toString().trim(),
          "password": passwordController.text.toString().trim(),
        };
        LoginApi loginApi = LoginApi(data);
        final response = await loginApi.login();

        log(response.toString());

        if (response['status'].toString().toLowerCase() == "success") {
          //  Map<String, dynamic> res = response['user'];

          AppHelper.AUTH_TOKEN_VALUE = response['accessToken'];
          AppHelper.email_VALUE = response['user']['email_address'];
          AppHelper.userid = response['user']['id'].toString();
          AppHelper.firstName = response['user']['first_name'].toString();
          AppHelper.lastName = response['user']['last_name'].toString();
          AppHelper.userAvatar = response['user']['user_avatar'].toString();
          AppHelper.role = response['user']['user_role'];
          
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString(
              AppStringFile.userid, response['user']['id'].toString());

          sharedPreferences.setString(AppStringFile.email,
              response['user']['email_address'].toString());

          sharedPreferences.setString(
              AppStringFile.name, response['user']['first_name'].toString());

          sharedPreferences.setString(
              AppStringFile.lastname, response['user']['last_name'].toString());

          sharedPreferences.setString(AppStringFile.userAvatar,
              response['user']['user_avatar'].toString());

          sharedPreferences.setString(
              AppStringFile.authtoken, response['accessToken'].toString());

          sharedPreferences.setString(
              AppStringFile.role, response['user']['user_role']);

          DialogHelper.showFlutterToast(strMsg: "Login Successful");

          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.dashBoardScreenActivity,
            (Route<dynamic> route) => false,
            arguments: {AppStringFile.email: emailController.text},
          );

          setState(() {
            isLoading = false;
          });
        } else {
          DialogHelper.showFlutterToast(strMsg: response['error'].toString());
          setState(() {
            error = response['error'].toString();
            isLoading = false;
          });
          if (error == "Customer not verified!")
            Navigator.pushNamed(context, Routes.otpVerify, arguments: {
              AppStringFile.pagetype: AppStringFile.signup,
              AppStringFile.email: email,
            });
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
      setState(() {
        isLoading = false;
      });
    }
  }
}
