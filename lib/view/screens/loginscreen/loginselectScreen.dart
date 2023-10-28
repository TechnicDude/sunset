import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/page_routes/routes.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';
import 'package:sunsetgardenapp/utils/buttons/button_widget.dart';
import 'package:sunsetgardenapp/view/screens/loginscreen/components/socialloginbutton.dart';

class LoginSelectScreenActivity extends StatefulWidget {
  const LoginSelectScreenActivity({super.key});

  @override
  State<LoginSelectScreenActivity> createState() =>
      _LoginSelectScreenActivityState();
}

class _LoginSelectScreenActivityState extends State<LoginSelectScreenActivity> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(top: 5.h, bottom: 5.h, left: 5.w, right: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    AppImages.loginscreen,
                    width: 40.w,
                    height: 40.w,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "letyou",
                  style: AppStyles.onboardtitle.copyWith(fontSize: 24.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SocialLoginscreenbuttonActivity(
                  logoimgname: AppImages.facebooklogo,
                  title: "login with fb",
                  onTap: () async {},
                ),
                SizedBox(
                  height: 2.h,
                ),
                SocialLoginscreenbuttonActivity(
                  logoimgname: AppImages.googlelogo,
                  title: "login with google",
                  onTap: () {},
                ),
                SizedBox(
                  height: 2.h,
                ),
                SocialLoginscreenbuttonActivity(
                  logoimgname: AppImages.applelogo,
                  title: "login with apple",
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    Container(
                      height: .2.h,
                      width: 40.w,
                      color: AppColors.colorgrey,
                    ),
                    Spacer(),
                    Text(
                      "or login with",
                      style: AppStyles.onboardsubtitle,
                    ),
                    Spacer(),
                    Container(
                      height: .2.h,
                      width: 40.w,
                      color: AppColors.colorgrey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                ButtonWidget(
                  text: "login with email",
                  onTap: () {
                    Navigator.pushNamed(context, Routes.loginScreen);
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "dont have account",
                      style: AppStyles.onboardbody.copyWith(
                          color: AppColors.colorgrey, fontSize: 16.sp),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context, Routes.signupscreen);
                      },
                      child: Text(
                        "Signup",
                        style: AppStyles.onboardbody.copyWith(
                            color: AppColors.primarycolors, fontSize: 16.sp),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
