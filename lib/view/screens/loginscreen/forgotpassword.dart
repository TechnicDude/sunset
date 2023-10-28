import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

String error = '';
bool isLoading = false;
TextEditingController emailController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.blackColor),
        backgroundColor: AppColors.colorswhite,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.only(top: 4.h, bottom: 2.h, left: 5.w, right: 5.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    MainBar(
                      text: "Forget Password",
                      subtext:
                          "Please enter the email ID. We will send you a OTP via email/SMS.",
                      image: AppImages.applogo,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFormScreen(
                      hinttext: "Email",
                      icon: Icons.mail,
                      textEditingController: emailController,
                      validator: AppValidator.emailValidator,
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
                      height: 5.h,
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

                        forgotPassword(emailController.text);
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Remember password?",
                          style: AppStyles.onboardtitle.copyWith(
                              color: AppColors.colorgrey, fontSize: 16.sp),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.loginScreen);
                          },
                          child: Text(
                            "Login",
                            style: AppStyles.onboardtitle.copyWith(
                                color: AppColors.primarycolors,
                                fontSize: 16.5.sp),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: MainBarBottom(
                        image: AppImages.bottomimage,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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

  forgotPassword(String email) async {
    setState(() {
      isLoading = true;
    });
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        var data = {
          "email_address": emailController.text.toString().trim(),
        };
        print(data);
        LoginApi loginApi = LoginApi(data);
        final response = await loginApi.sentotp();

        if (response['status'].toString().toLowerCase() == "success") {
          // AppHelper().dialogBuilderforget(context, "Check Your Email",
          //     "Please check the email address $email for instructions to reset your password.");
          setState(() {
            isLoading = false;
          });

          Navigator.pushNamed(context, Routes.otpVerify, arguments: {
            AppStringFile.email: email,
            AppStringFile.pagetype: AppStringFile.forgot_password,
            //  StringFile.id: response['user']['id'],
          });
        } else {
          DialogHelper.showFlutterToast(strMsg: response['error'].toString());
          setState(() {
            error = response['error'].toString();
            isLoading = false;
          });
        }
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      AppHelper().dialogBuilder(
          context, "No Internet!", "Internet connection not available");
      setState(() {
        isLoading = false;
      });
    }
  }
}
