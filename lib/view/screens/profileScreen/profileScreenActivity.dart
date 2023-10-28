import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/api/api.dart';
import 'package:sunsetgardenapp/api/apphelper.dart';
import 'package:sunsetgardenapp/page_routes/routes.dart';
import 'package:sunsetgardenapp/provider/profileprovider.dart';
import 'package:sunsetgardenapp/utils/app_string.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';
import 'package:sunsetgardenapp/utils/settingswidgetui.dart';
import 'package:sunsetgardenapp/utils/title_text_style.dart';

class ProfileScreenActivity extends StatefulWidget {
  const ProfileScreenActivity({super.key});

  @override
  State<ProfileScreenActivity> createState() => _ProfileScreenActivityState();
}

class _ProfileScreenActivityState extends State<ProfileScreenActivity> {
  ProfileUserProvider _profileuserProvider = ProfileUserProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _profileuserProvider =
        Provider.of<ProfileUserProvider>(context, listen: false);
    _profileuserProvider.profileuserlist(AppHelper.userid ?? '');
  }

  bool showpop = false;
  // bool light = true;
  // bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorswhite,
      appBar: AppBar(
        backgroundColor: AppColors.colorswhite,
        iconTheme: IconThemeData(
          color: AppColors.blackColor,
        ),
        elevation: 0,
        title: TitleTextStyle(
          text: "My Profile",
        ),
      ),
      body: Consumer<ProfileUserProvider>(
        builder: (context, profileUserProvider, child) {
          print(profileUserProvider.profileuserList);

          return Stack(
            children: [
              Container(
                height: 8.h,
                color: AppColors.colorswhite,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
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
                        Padding(
                            padding: EdgeInsets.only(bottom: 1.h),
                            child: profileUserProvider.profileuserList.length !=
                                    0
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 250,
                                        height: 60,
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      profileUserProvider
                                                              .profileuserList
                                                              .isNotEmpty
                                                          ? profileUserProvider
                                                                  .profileuserList[
                                                                      0]
                                                                  .firstName ??
                                                              ''
                                                          : '',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: AppStyles
                                                          .onboardtitle
                                                          .copyWith(
                                                        fontSize: 16.sp,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 1.w,
                                                    ),
                                                    Text(
                                                      profileUserProvider
                                                              .profileuserList
                                                              .isNotEmpty
                                                          ? profileUserProvider
                                                                  .profileuserList[
                                                                      0]
                                                                  .lastName ??
                                                              ' '
                                                          : '',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: AppStyles
                                                          .onboardtitle
                                                          .copyWith(
                                                        fontSize: 16.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 0.5,
                                                ),
                                                SizedBox(
                                                  width: 33.w,
                                                  child: Text(
                                                    profileUserProvider
                                                            .profileuserList
                                                            .isNotEmpty
                                                        ? profileUserProvider
                                                                .profileuserList[
                                                                    0]
                                                                .emailAddress ??
                                                            ''
                                                        : '',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: AppStyles
                                                        .onboardsubtitle
                                                        .copyWith(
                                                      fontSize: 14.sp,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Container()),
                        // ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                        Settingwidgetui(
                          icon: Icons.edit_outlined,
                          title: "Edit Profile",
                          onTap: () {
                            Navigator.pushNamed(context, Routes.editProfile,
                                arguments: {
                                  AppStringFile.profileuserdata:
                                      profileUserProvider.profileuserList,
                                }).then((value) {
                              _profileuserProvider
                                  .profileuserlist(AppHelper.userid ?? '');
                            });
                          },
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                        Settingwidgetui(
                          icon: Icons.lock_reset,
                          title: "Change Password",
                          onTap: () {
                            Navigator.pushNamed(context, Routes.changePassword);
                          },
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                        Settingwidgetui(
                          icon: Icons.help_outline_rounded,
                          title: "Help and Support",
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.webviewWidgetUIScreen,
                                arguments: {
                                  AppStringFile.title: "Help and Support",
                                  AppStringFile.url: APIURL.contactus,
                                });
                          },
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                        Settingwidgetui(
                          icon: Icons.manage_accounts,
                          title: "Settings",
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.settingScreenActivity);
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
                                          style:
                                              AppStyles.onboardtitle.copyWith(
                                            fontSize: 17.sp,
                                          ))),
                                  TextButton(
                                      onPressed: () async {
                                        AppHelper.logout();

                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pushNamedAndRemoveUntil(
                                                Routes.loginScreen,
                                                (Route<dynamic> route) =>
                                                    false);
                                      },
                                      child: Text(
                                        "Yes",
                                        style: AppStyles.onboardtitle.copyWith(
                                          fontSize: 17.sp,
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
                        Text("Sunset Gardens \nVersion v1.0.0",
                            textAlign: TextAlign.center,
                            style: AppStyles.onboardsubtitle.copyWith(
                              fontSize: 13.sp,
                            )),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, left: 7.w),
                child: profileUserProvider.profileuserList.length != 0
                    ? CircleAvatar(
                        radius: 6.h,
                        backgroundColor: AppColors.colorgrey.withOpacity(0.3),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.editProfile,
                                arguments: {
                                  AppStringFile.profileuserdata:
                                      profileUserProvider.profileuserList,
                                }).then((value) {
                              _profileuserProvider
                                  .profileuserlist(AppHelper.userid ?? '');
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 5.5.h,
                            backgroundImage: //AssetImage(AppImages.profile)
                                profileUserProvider
                                            .profileuserList[0].userAvatar !=
                                        null
                                    ? NetworkImage(APIURL.imageurl +
                                        profileUserProvider
                                            .profileuserList[0].userAvatar!)
                                    : AssetImage(
                                        AppImages.profile,
                                      ) as ImageProvider,
                          ),
                        ),
                      )
                    : Container(),
              )
            ],
          );
        },
      ),
    );
  }
}
