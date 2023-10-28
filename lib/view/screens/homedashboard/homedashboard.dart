import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/api/apphelper.dart';
import 'package:sunsetgardenapp/page_routes/routes.dart';
import 'package:sunsetgardenapp/provider/dashboardprovider.dart';
import 'package:sunsetgardenapp/utils/Appiconsbutton.dart';
import 'package:sunsetgardenapp/utils/app_string.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/extentions.dart';
import 'package:sunsetgardenapp/view/screens/homedashboard/homecardscreentwoui.dart';
import 'package:sunsetgardenapp/view/screens/homedashboard/sliderscreen.dart';

class HomeDashboardSCreenActivity extends StatefulWidget {
  final Function? callback;
  const HomeDashboardSCreenActivity({super.key, this.callback});

  @override
  State<HomeDashboardSCreenActivity> createState() =>
      _HomeDashboardSCreenActivityState();
}

class _HomeDashboardSCreenActivityState
    extends State<HomeDashboardSCreenActivity> {
  Widget _icon(IconData icon, {Color color = AppColors.primarycolors}) {
    return Container(
      height: 4.2.h,
      decoration: BoxDecoration(
        color: AppColors.primarycolors,
        borderRadius: BorderRadius.all(Radius.circular(2.w)),
        //   borderRadius: BorderRadius.only(
        //  topRight: Radius.circular(4.w),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Image.asset(
          AppImages.navbar,
          color: AppColors.colorswhite,
        ),
      ),
    );
  }

  DashBoradProvider _dashBoradProvider = DashBoradProvider();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _dashBoradProvider = Provider.of<DashBoradProvider>(context, listen: false);
    getalldata();
    print("userid ${AppHelper.userid}");
    print(AppHelper.userid);
    print(AppHelper.AUTH_TOKEN_VALUE);
    super.initState();
  }

  getalldata() async {
    await _dashBoradProvider.bannerlist("main/");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoradProvider>(
        builder: (context, dashBoradProvider, child) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 2.h, left: 3.w, right: 3.w),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RotatedBox(
                      quarterTurns: 4,
                      child: _icon(Icons.sort, color: Colors.white).ripple(() {
                        widget.callback!("okopen");
                      }),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),

                    SizedBox(
                        height: 4.h,
                        width: 25.w,
                        child: Image.asset(
                          AppImages.logobanner,
                          color: AppColors.primarycolors,
                        )),

                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     RichText(
                    //       text: TextSpan(
                    //         text: "Good ",
                    //         style:
                    //             AppStyles.onboardtitle.copyWith(fontSize: 16.sp),
                    //         children: <TextSpan>[
                    //           TextSpan(
                    //             text: "${AppHelper().greeting()}",
                    //             style: AppStyles.onboardtitle.copyWith(
                    //                 fontSize: 16.sp,
                    //                 color: AppColors.primarycolors),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     RichText(
                    //       text: TextSpan(
                    //         text: '${AppHelper.firstName}',
                    //         style: AppStyles.onboardsubtitle
                    //             .copyWith(fontSize: 15.sp),
                    //         children: <TextSpan>[
                    //           TextSpan(
                    //               text: ",",
                    //               style: AppStyles.onboardsubtitle.copyWith(
                    //                   fontSize: 15.sp,
                    //                   color: AppColors.primarycolors)),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    const Spacer(),

                    Stack(
                      alignment: Alignment.topRight,
                      clipBehavior: Clip.none,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.searchScreentActivity);
                          },
                          child: const Icon(
                            Icons.search_sharp,
                            color: AppColors.primarycolors,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    AppIconButtonsScreenActivity(
                        icondata: Icons.notifications_none,
                        color: AppColors.primarycolors,
                        onTap: () {
                          Navigator.pushNamed(context, Routes.notification);
                        }),
                    SizedBox(
                      width: 3.w,
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (dashBoradProvider.bannerList.isNotEmpty)
                            SliderScreen(
                                bannerdata: dashBoradProvider.bannerList),
                          SizedBox(
                            height: 2.h,
                          ),

                          // HomeContainerCard(
                          //   text: "Services",
                          //   image: AppImages.services,
                          //   boxcolor: AppColors.claycardservice,
                          // ),

                          Row(
                            children: [
                              HomeContainerCardTwo(
                                text: "Services",
                                image: AppImages.services,
                                //  boxcolor: AppColors.claycardcontact,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    Routes.servicesScreenActivity,
                                    arguments: {
                                      AppStringFile.bannertypes:
                                          AppStringFile.bannertypes,
                                      // StringFile.screenname:
                                      //     StringFile.bannerfoodtype,
                                    },
                                  );

                                  // Navigator.pushNamed(
                                  //     context, Routes.servicesScreenActivity);
                                },
                              ),
                              HomeContainerCardTwo(
                                text: "Facilities",
                                image: AppImages.facility,
                                onTap: () {},
                              ),
                              HomeContainerCardTwo(
                                text: "Bills",
                                image: AppImages.bills,
                                onTap: () {},
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              HomeContainerCardTwo(
                                text: "Cafeteria",
                                image: AppImages.cafeteria,
                                onTap: () {},
                              ),
                              HomeContainerCardTwo(
                                text: "Investment Results",
                                image: AppImages.investment,
                                onTap: () {},
                              ),
                              HomeContainerCardTwo(
                                text: "ESG \nInformation",
                                image: AppImages.esg,
                                // boxcolor:
                                //     AppColors.claycardcontact.withOpacity(0.6),
                                onTap: () {},
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              HomeContainerCardTwo(
                                text: "Announcement",
                                image: AppImages.announcements,
                              ),
                              HomeContainerCardTwo(
                                text: "Contact Us",
                                image: AppImages.contactus,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
