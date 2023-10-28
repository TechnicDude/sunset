import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunsetgardenapp/api/apphelper.dart';
import 'package:sunsetgardenapp/api/loginapi.dart';
import 'package:sunsetgardenapp/page_routes/routes.dart';
import 'package:sunsetgardenapp/utils/app_string.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';
import 'package:sunsetgardenapp/utils/buttons/button_widget.dart';
import 'package:sunsetgardenapp/utils/dialoghelper.dart';
import 'package:sunsetgardenapp/utils/loaderscreennew.dart';
import 'package:sunsetgardenapp/utils/mainbar.dart';
import 'package:sunsetgardenapp/utils/mainbarbottom.dart';

class OtpVerify extends StatefulWidget {
  final String? id;
  final String? email;
  final String? userid;
  final String? pagetype;
  const OtpVerify({Key? key, this.id, this.email, this.pagetype, this.userid})
      : super(key: key);
  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}
class _OtpVerifyState extends State<OtpVerify> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String _finalotp = '';
  String error = '';

  forgotPassword(String email) async {
    var data = {
      'email': email.toString().trim(),
    };
    print(email.toString());
    LoginApi registerresponse = LoginApi(data);
    final response = await registerresponse.sentotp();
    if (response['status'].toString() == "success") {
      // Navigator.pushNamed(context, Routes.otpVerify, arguments: {
      //   AppStringFile.email: email,
      //   AppStringFile.pagetype: AppStringFile.forgot_password,
      // StringFile.id: response['user']['id'],
      // });
      DialogHelper.showFlutterToast(strMsg: "success");
    } else {
      setState(() {
        error = response['_error'].toString();
        isLoading = false;
      });
    }
  }

  Future<void> fetchdata() async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_finalotp.length == 6) {
        var data = {
          'email': widget.email.toString().trim(),
          'otp': _finalotp.toString().trim(),
        };
        LoginApi registerresponse = LoginApi(data);
        var response;
        if (widget.pagetype == AppStringFile.forgot_password) {
          response = await registerresponse.verifyOtp();

          print(response);
          print(data.toString());
          if (response['status'].toString().toLowerCase() == "success") {
            Navigator.pushNamed(context, Routes.changenewPassword, arguments: {
              AppStringFile.email: widget.email,
              AppStringFile.id: widget.id,
              AppStringFile.otp: _finalotp,
            });
            DialogHelper.showFlutterToast(
                strMsg: "Otp Verification Done Successfully");
            setState(() {
              isLoading = false;
            });
          } else {
            DialogHelper.showFlutterToast(
                strMsg: response['error']); //"Registration Failed!");
            setState(() {
              error = response['error'];
            });
          }
        } else {
          print("object data new");
          // response = await registerresponse.forgetverifyOtp();
          response = await registerresponse.verifyOtp();
          print(response);
          print(data.toString());
          if (response['status'].toString().toLowerCase() == "success") {
            Map<String, dynamic> res = response['data'];
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();

            AppHelper.userid = res['id'].toString();
            AppHelper.email_VALUE = widget.email;
            AppHelper.AUTH_TOKEN_VALUE = response['token'].toString();

            sharedPreferences.setString(
                AppStringFile.userid, res['id'].toString());

            sharedPreferences.setString(
                AppStringFile.email, widget.email.toString());
            sharedPreferences.setString(
                AppStringFile.authtoken, response['token'].toString());

            DialogHelper.showFlutterToast(strMsg: response['message']);
            String? token;

            // try {
            //   token = (await FirebaseMessaging.instance.getToken())!;
            //   print(token);
            // } catch (e) {
            //   print(e);
            // }
            // var body = {"facId": token};
            // LoginApi responsefcmtoken = LoginApi(body);
            // final responsefcmtokenreturn =
            //     await responsefcmtoken.factokenregister();
            //print(responsefcmtokenreturn);
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.dashBoardScreenActivity, (route) => false);
          } else {
            print(response);
            DialogHelper.showFlutterToast(strMsg: response['error']);
            setState(() {
              error = response['error'].toString();
              isLoading = false;
            });
          }
        }
      }
    } else {
      setState(() {
        isLoading = false;
      });
      DialogHelper().shoppopDialog(context);
    }
  }

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
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MainBar(
                    text: "Verification Code",
                    image: AppImages.applogo,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "We have sent you an OTP\n on 📩",
                        style: AppStyles.onboardsubtitle.copyWith(
                          color: Colors.grey,
                          fontSize: 16.sp,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: AppHelper
                                  .email_VALUE, //"deepika@imperialit.in",
                              style: AppStyles.onboardtitle.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //ForgetPassword();
                                }),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 6,
                      obscureText: false,
                      cursorColor: AppColors.colortextgrey,
                      animationType: AnimationType.fade,
                      pastedTextStyle: TextStyle(
                        color: AppColors.primarycolors,
                        fontWeight: FontWeight.bold,
                      ),
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          disabledColor: AppColors.colorswhite,
                          borderRadius: BorderRadius.circular(1.h),
                          fieldHeight: 100.w / 8,
                          fieldWidth: 100.w / 8,
                          activeFillColor: AppColors.colorswhite,
                          inactiveColor: AppColors.colorgrey,
                          inactiveFillColor: AppColors.colorswhite,
                          selectedFillColor: AppColors.colorswhite,
                          selectedColor: AppColors.primarycolors,
                          activeColor: AppColors.primarycolors),
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      onCompleted: (v) {
                        print("Completed");
                        _finalotp = v;
                        print(_finalotp);
                      },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          // currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        return true;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  // Center(
                  //   child: Text(
                  //     "Resend code in 59 sec",
                  //     style: AppStyles.onboardsubtitle.copyWith(
                  //         color: AppColors.blackColor, fontSize: 16.sp),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 2.h,
                  // ),
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
                    text: "Verify",
                    onTap: () {
                      if (isLoading) {
                        return;
                      }
                      //  fetchdata();

                      setState(() {
                        fetchdata();
                      });
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Otp not received? ",
                        style: AppStyles.onboardsubtitle.copyWith(
                          color: Colors.grey,
                          fontSize: 16.sp,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Resend",
                              style: AppStyles.onboardsubtitle.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //ForgetPassword();
                                }),
                        ],
                      ),
                    ),
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
}
