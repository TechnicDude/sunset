import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/api/api.dart';
import 'package:sunsetgardenapp/api/apphelper.dart';
import 'package:sunsetgardenapp/page_routes/routes.dart';
import 'package:sunsetgardenapp/utils/app_string.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';
import 'package:sunsetgardenapp/utils/mainbarbottom.dart';
import 'package:sunsetgardenapp/view/screens/homedashboard/drawer/DrawerItemui.dart';

class MenuBarScreens extends StatefulWidget {
  const MenuBarScreens({Key? key}) : super(key: key);

  @override
  State<MenuBarScreens> createState() => _MenuBarScreensState();
}

class _MenuBarScreensState extends State<MenuBarScreens> {
  bool showpop = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      backgroundColor: Theme.of(context).cardTheme.color,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(4.w),
            bottomRight: Radius.circular(4.w),
          ),
          //border: Border.all(color: AppColors.greyColor, width: 1),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: 8.h, right: 2.h, left: 2.h, bottom: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 4.h,
                    backgroundColor: AppColors.colorswhite.withOpacity(0.2),
                    child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 4.h,
                        backgroundColor: AppColors.colorswhite.withOpacity(0.2),
                        child: GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 3.5.h,
                            backgroundImage: AppHelper.userAvatar != null
                                ? NetworkImage(
                                    APIURL.imageurl + AppHelper.userAvatar!)
                                : AssetImage(
                                    AppImages.profile,
                                  ) as ImageProvider,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            child: Text(
                              '${AppHelper.firstName}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.onboardtitle.copyWith(
                                  fontSize: 15.sp,
                                  color: AppColors.primarycolors),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          SizedBox(
                            width: 20.w,
                            child: Text(
                              '${AppHelper.lastName}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.onboardtitle.copyWith(
                                  fontSize: 15.sp,
                                  color: AppColors.primarycolors),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 0.2.h,
                      ),
                      SizedBox(
                        width: 40.w,
                        child: Text(
                          '${AppHelper.email_VALUE}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.onboardsubtitle
                              .copyWith(fontSize: 14.sp),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Divider(
                height: 1.h,
                color: AppColors.colorgrey,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 1.h,
                  right: 1.h,
                  left: 1.h,
                ),
                child: Column(
                  children: [
                    DrawerItem(
                      icon: Icons.home,
                      title: "Dashboard",
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.dashBoardScreenActivity);
                      },
                    ),
                    DrawerItem(
                      icon: Icons.menu_open_rounded,
                      title: "Services",
                      onTap: () {},
                    ),
                    DrawerItem(
                      icon: Icons.grid_view_rounded,
                      title: "Category",
                      onTap: () {
                        // Navigator.pushReplacementNamed(
                        //     context, Routes.dashBoardScreenActivity);
                      },
                    ),
                    DrawerItem(
                      icon: Icons.favorite_rounded,
                      title: "Favorites",
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.favoriteScreenActivity);
                      },
                    ),
                    DrawerItem(
                      icon: Icons.settings,
                      title: "settings",
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.settingScreenActivity);
                      },
                    ),
                    DrawerItem(
                      icon: Icons.help,
                      title: "Help Support",
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.webviewWidgetUIScreen,
                            arguments: {
                              AppStringFile.title: "Help Support",
                              AppStringFile.url: APIURL.contactus,
                            });
                      },
                    ),
                    DrawerItem(
                      icon: Icons.logout,
                      // title: "Logout",
                      title: AppHelper.userid == null ? "Login" : "Logout",
                      onTap: () async {
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
                                        fontSize: 17.sp,
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
                                      fontSize: 17.sp,
                                    ),
                                  )),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
              Spacer(),
              const Divider(
                color: Colors.black12,
                thickness: 1,
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 2.5.h,
                    child: Center(
                      child: Image.asset(
                        AppImages.bottomimage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    "v1.0.0",
                    style: AppStyles.onboardsubtitle.copyWith(
                      fontSize: 14.sp,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
