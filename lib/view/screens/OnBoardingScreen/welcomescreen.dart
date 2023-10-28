import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/page_routes/routes.dart';
import 'package:sunsetgardenapp/utils/app_string.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';
import 'package:sunsetgardenapp/utils/buttons/button_widget_cou.dart';
import 'package:sunsetgardenapp/utils/cardbutton.dart';
import 'package:sunsetgardenapp/utils/mainbar.dart';
import 'package:sunsetgardenapp/utils/mainbarbottom.dart';
import 'package:sunsetgardenapp/utils/welcomebutton.dart';

class WelcomeScreenActivity extends StatefulWidget {
  const WelcomeScreenActivity({super.key});

  @override
  State<WelcomeScreenActivity> createState() => _WelcomeScreenActivityState();
}

bool hour1 = true;
bool hour2 = false;
bool hour3 = false;
bool hour4 = false;

class _WelcomeScreenActivityState extends State<WelcomeScreenActivity> {
  int selectedIndex = 0;
  String radioButtonItem = 'home';
  bool showpoppScheduleSuccess = false;
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 7.h, left: 4.w, right: 4.w),
            child: Column(
              children: [

                MainBar(
                  text: "WELCOME",
                  subtext: "Create an account",
                  image: AppImages.applogo,
                ),

                SizedBox(
                  height: 1.h,
                ),

                WelcomeButtonWidget(
                  width: 82.w,
                  boxcolor: AppColors.primarycolors,
                  text: "GET STARTED",
                  onTap: () {
                    Navigator.pushNamed(context, Routes.signupscreen);
                  },
                ),

                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: AppStyles.onboardtitle.copyWith(
                          color: AppColors.colorgreydark, fontSize: 16.sp),
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
                            color: AppColors.primarycolors, fontSize: 17.sp),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 36.w,
                        child: ButtonWidgetCard(
                          buttoncolor:
                              hour1 ? AppColors.primarycolors : Colors.white,
                          buttontextcolor:
                              hour1 ? Colors.white : AppColors.primarycolors,
                          boardcolor: AppColors.primarycolors,
                          imagecolor:
                              hour1 ? Colors.white : AppColors.primarycolors,
                          image: AppImages.downloadbrochure,
                          text: "Download Brocher",
                          onTap: () {
                            setState(() {
                              hour1 = true;
                              hour2 = false;
                              hour3 = false;
                              hour4 = false;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      SizedBox(
                        width: 36.w,
                        child: ButtonWidgetCard(
                          buttoncolor: hour2
                              ? AppColors.primarycolors
                              : Colors.transparent,
                          buttontextcolor:
                              hour2 ? Colors.white : AppColors.primarycolors,
                          boardcolor: AppColors.primarycolors,
                          imagecolor:
                              hour2 ? Colors.white : AppColors.primarycolors,
                          text: "Sunset Stays",
                          image: AppImages.sunsetstays,
                          onTap: () {
                            setState(() {
                              hour1 = false;
                              hour2 = true;
                              hour3 = false;
                              hour4 = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 36.w,
                        child: ButtonWidgetCard(
                          buttoncolor: hour3
                              ? AppColors.primarycolors
                              : Colors.transparent,
                          buttontextcolor:
                              hour3 ? Colors.white : AppColors.primarycolors,
                          boardcolor: AppColors.primarycolors,
                          imagecolor:
                              hour3 ? Colors.white : AppColors.primarycolors,
                          image: AppImages.demo,
                          text: "Demo",
                          onTap: () {
                            setState(() {
                              hour1 = false;
                              hour2 = false;
                              hour3 = true;
                              hour4 = false;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      SizedBox(
                        width: 36.w,
                        child: ButtonWidgetCard(
                          buttoncolor: hour4
                              ? AppColors.primarycolors
                              : Colors.transparent,
                          buttontextcolor:
                              hour4 ? Colors.white : AppColors.primarycolors,
                          boardcolor: AppColors.primarycolors,
                          image: AppImages.contactsales,
                          imagecolor:
                              hour4 ? Colors.white : AppColors.primarycolors,
                          text: "Contact Sales",
                          onTap: () {
                            setState(() {
                              hour1 = false;
                              hour2 = false;
                              hour3 = false;
                              hour4 = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // ListView.builder(
                //     itemCount: 1,
                //     shrinkWrap: true,
                //     scrollDirection: Axis.vertical,
                //     itemBuilder: (context, index) {
                //       return Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           // alignment: WrapAlignment.center,
                //           // spacing: 8.0, // gap between adjacent chips
                //           // runSpacing: 4.0,
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   SizedBox(
                //                     width: 38.w,
                //                     height: 25.w,
                //                     child: ButtonWidgetCard(
                //                       heightbuttom: 4.h,
                //                       buttoncolor: hour3
                //                           ? AppColors.primarycolors
                //                           : Colors.transparent,
                //                       buttontextcolor: hour3
                //                           ? Colors.white
                //                           : AppColors.primarycolors,
                //                       boardcolor: AppColors.primarycolors,
                //                       fontsize: 21.sp,
                //                       text: "Services",
                //                       onTap: () {
                //                         setState(() {
                //                           hour1 = false;
                //                           hour2 = false;
                //                           hour3 = true;
                //                           hour4 = false;
                //                         });
                //                         selectedIndex = index;
                //                       },
                //                     ),
                //                   ),
                //                   SizedBox(
                //                     width: 4.w,
                //                   ),
                //                   SizedBox(
                //                     width: 38.w,
                //                     height: 25.w,
                //                     child: ButtonWidgetCard(
                //                       heightbuttom: 4.h,
                //                       buttoncolor: hour4
                //                           ? AppColors.primarycolors
                //                           : Colors.transparent,
                //                       buttontextcolor: hour4
                //                           ? Colors.white
                //                           : AppColors.primarycolors,
                //                       boardcolor: AppColors.primarycolors,
                //                       fontsize: 21.sp,
                //                       text: "Contact Sales",
                //                       onTap: () {
                //                         setState(() {
                //                           hour1 = false;
                //                           hour2 = false;
                //                           hour3 = false;
                //                           hour4 = true;
                //                         });
                //                         selectedIndex = index;
                //                       },
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ]);
                //     }),

                MainBarBottom(
                  image: AppImages.bottomimage,
                ),
                SizedBox(
                  height: 1.h,
                ),
              ],
            ),
          ),
        )
      ])),
    );
  }
}
