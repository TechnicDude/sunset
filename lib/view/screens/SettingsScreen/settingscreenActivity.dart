import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sunsetgardenapp/api/api.dart';
import 'package:sunsetgardenapp/api/apphelper.dart';
import 'package:sunsetgardenapp/api/loginapi.dart';
import 'package:sunsetgardenapp/page_routes/routes.dart';
import 'package:sunsetgardenapp/utils/app_string.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';
import 'package:sunsetgardenapp/utils/dialoghelper.dart';
import 'package:sunsetgardenapp/utils/settingswidgetui.dart';
import 'package:sunsetgardenapp/utils/title_text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreenActivity extends StatefulWidget {
  const SettingScreenActivity({super.key});

  @override
  State<SettingScreenActivity> createState() => _SettingScreenActivityState();
}

class _SettingScreenActivityState extends State<SettingScreenActivity> {
  bool showpop = false;
  bool light = true;
  bool notificationval = true;
  final Uri _url = Uri.parse(APIURL.playstoreurl);
  bool isLoading = false;
  String error = '';
  String _error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorswhite,
      appBar: AppBar(
        backgroundColor: AppColors.colorswhite,
        iconTheme: const IconThemeData(
          color: AppColors.blackColor,
        ),
        elevation: 0,
        centerTitle: true,
        title: const TitleTextStyle(
          text: "Settings",
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 20.h,
            color: AppColors.colorswhite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 6.h,
                  backgroundColor: AppColors.colorgrey.withOpacity(0.3),
                  child: CircleAvatar(
                    radius: 5.5.h,
                    backgroundColor: AppColors.colorgrey,
                    backgroundImage: AppHelper.userAvatar != null
                        ? NetworkImage(APIURL.imageurl + AppHelper.userAvatar!)
                        : AssetImage(
                            AppImages.profile,
                          ) as ImageProvider,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.profileScreenActivity);
                        },
                        child: CircleAvatar(
                          radius: 1.7.h,
                          backgroundColor:
                              AppColors.blackColor.withOpacity(0.5),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 2.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    '${AppHelper.firstName}',
                    style: AppStyles.onboardtitle.copyWith(
                        fontSize: 16.sp, color: AppColors.primarycolors),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    '${AppHelper.lastName}',
                    style: AppStyles.onboardtitle.copyWith(
                        fontSize: 16.sp, color: AppColors.primarycolors),
                  ),
                ]),
                SizedBox(
                  height: 0.2.h,
                ),
                Text(
                  '${AppHelper.email_VALUE}',
                  style: AppStyles.onboardsubtitle.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: const BoxDecoration(
                color: AppColors.colorswhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(1, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: ListView(
                  children: [
                    Settingwidgetui(
                      icon: Icons.perm_phone_msg_outlined,
                      title: "Contact Us",
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.webviewWidgetUIScreen,
                            arguments: {
                              AppStringFile.title: "Contact Us",
                              AppStringFile.url: APIURL.contactus,
                            });
                      },
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    Settingwidgetui(
                      icon: Icons.supervised_user_circle_rounded,
                      title: "Abaut Us",
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.webviewWidgetUIScreen,
                            arguments: {
                              AppStringFile.title: "Abaut Us",
                              AppStringFile.url: APIURL.aboutus,
                            });
                      },
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    Settingwidgetui(
                      icon: Icons.privacy_tip,
                      title: "Privacy policy",
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.webviewWidgetUIScreen,
                            arguments: {
                              AppStringFile.title: "Privacy policy",
                              AppStringFile.url: APIURL.privacypolicy,
                            });
                      },
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    Settingwidgetui(
                        icon: Icons.lock_reset,
                        title: "Terms & Condition",
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.webviewWidgetUIScreen,
                              arguments: {
                                AppStringFile.title: "Terms and Condition",
                                AppStringFile.url: APIURL.termsandcondition,
                              });
                        }),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    Settingwidgetui(
                      icon: Icons.share,
                      title: "Share App",
                      onTap: () {
                        Share.share(
                            'hey! check out Sunset Gardens ${APIURL.shareapp}');
                      },
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    Settingwidgetui(
                      icon: Icons.star,
                      title: "Rate App",
                      onTap: _launchUrl,
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    Settingwidgetui(
                      icon: Icons.delete_sweep,
                      title: "Delete Account",
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text(
                              "Delete Account",
                              style: AppStyles.onboardtitle.copyWith(
                                  fontSize: 18.sp,
                                  color: AppColors.primarycolors),
                            ),
                            content: Text(
                                "Are you sure you want to delete the account ?",
                                style: AppStyles.onboardsubtitle
                                    .copyWith(fontSize: 16.sp)),
                            actions: <Widget>[
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _error = '';
                                        });
                                        if (isLoading) {
                                          return;
                                        }

                                        deleteAccount(
                                            AppHelper.userid.toString(),
                                            context);
                                      },
                                      child: Text(
                                        "YES",
                                        style: AppStyles.onboardtitle.copyWith(
                                            fontSize: 16.sp,
                                            color: AppColors.colorswhite),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.red),
                                    ),
                                  ),
                                  SizedBox(width: 6.w),
                                  Expanded(
                                      child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("NO",
                                        style: AppStyles.onboardtitle.copyWith(
                                            fontSize: 16.sp,
                                            color: AppColors.colorswhite)),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                    ),
                                  ))
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    Settingwidgetui(
                      icon: Icons.logout,
                      title: "Logout",
                      onTap: () {
                        return showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text(
                              "Logout",
                              style: AppStyles.onboardtitle.copyWith(
                                  fontSize: 18.sp,
                                  color: AppColors.primarycolors),
                            ),
                            content: Text(
                              "Are you sure want to logout App?",
                              style: AppStyles.onboardsubtitle.copyWith(
                                fontSize: 16.sp,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Text("No",
                                      style: AppStyles.onboardtitle.copyWith(
                                        fontSize: 16.sp,
                                      ))),
                              TextButton(
                                  onPressed: () async {
                                    AppHelper.logout();
                                    Navigator.of(context, rootNavigator: true)
                                        .pushNamedAndRemoveUntil(
                                            Routes.loginScreen,
                                            (Route<dynamic> route) => false);
                                  },
                                  child: Text(
                                    "Yes",
                                    style: AppStyles.onboardtitle.copyWith(
                                      fontSize: 16.sp,
                                    ),
                                  )),
                            ],
                          ),
                        );
                      },
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Sunset Gardens",
                          style: AppStyles.onboardsubtitle
                              .copyWith(fontSize: 13.sp),
                          children: <TextSpan>[
                            TextSpan(
                                text: '\nVersion v1.0.0',
                                style: AppStyles.onboardsubtitle
                                    .copyWith(fontSize: 13.sp))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  deleteAccount(String ids, BuildContext context) async {
    var data = {
      'id': ids,
    };

    LoginApi registerresponse = LoginApi(data);
    final response = await registerresponse.deleteaccount(ids);
    if (response['status'].toString() == "success") {
      AppHelper.logout();

      Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
          Routes.loginScreen, (Route<dynamic> route) => false);
      DialogHelper.showFlutterToast(strMsg: response['message'].toString());
    } else {
      DialogHelper.showFlutterToast(strMsg: response['message'].toString());
    }
  }
}
