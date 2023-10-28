import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/provider/dashboardprovider.dart';
import 'package:sunsetgardenapp/provider/profileprovider.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';
import 'package:sunsetgardenapp/utils/showExitPopup.dart';
import 'package:sunsetgardenapp/view/screens/homedashboard/drawer/menubar.dart';
import 'package:sunsetgardenapp/view/screens/homedashboard/homedashboard.dart';
import 'package:sunsetgardenapp/view/screens/profileScreen/profileScreenActivity.dart';
import 'package:sunsetgardenapp/view/screens/servicesScreens/servicesScreenActivity.dart';

class DashBoardScreenActivity extends StatefulWidget {
  const DashBoardScreenActivity({super.key});

  @override
  State<DashBoardScreenActivity> createState() =>
      _DashBoardScreenActivityState();
}

class _DashBoardScreenActivityState extends State<DashBoardScreenActivity> {
  int _currentIndex = 0;

  bool isHomePageSelected = true;
  GlobalKey<ScaffoldState> _key = GlobalKey();
  List tabs = [];

  onBottomIconPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetdata();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  fetdata() {
    tabs = [
      ChangeNotifierProvider<DashBoradProvider>(
          create: (BuildContext context) => DashBoradProvider(),
          child: HomeDashboardSCreenActivity(
            callback: (value) {
              if (value == "okopen") {
                _key.currentState!.openDrawer();
              }
            },
          )),
      ChangeNotifierProvider<ProfileUserProvider>(
          create: (BuildContext context) => ProfileUserProvider(),
          child: ProfileScreenActivity()),
      ChangeNotifierProvider<ProfileUserProvider>(
          create: (BuildContext context) => ProfileUserProvider(),
          child: ProfileScreenActivity()),
      ChangeNotifierProvider<ProfileUserProvider>(
          create: (BuildContext context) => ProfileUserProvider(),
          child: ProfileScreenActivity()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        key: _key,
        drawer: MenuBarScreens(),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        body: SafeArea(child: tabs[_currentIndex]),
        bottomNavigationBar: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2.5.h),
                topRight: Radius.circular(2.5.h),
              ),
              child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: AppColors
                      .primarycolors, //Theme.of(context).cardTheme.color,
                  iconSize: 20.0,
                  selectedIconTheme: const IconThemeData(size: 25.0),
                  selectedItemColor: AppColors.colorswhite,
                  unselectedItemColor: AppColors.colorswhite,
                  selectedFontSize: 14.sp,
                  unselectedFontSize: 13.sp,
                  selectedLabelStyle:
                      AppStyles.onboardtitle.copyWith(fontSize: 14.sp),
                  unselectedLabelStyle:
                      AppStyles.onboardtitle.copyWith(fontSize: 13.sp),
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined),
                        activeIcon: Icon(Icons.home),
                        label: "Home",
                        backgroundColor: Colors.white),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.grid_view_outlined),
                        activeIcon: Icon(Icons.grid_view_rounded),
                        label: "Menu",
                        backgroundColor: Colors.white),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.calendar_month_outlined),
                        activeIcon: Icon(Icons.calendar_month_sharp),
                        label: "Calender",
                        backgroundColor: Colors.white),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline_rounded),
                        activeIcon: Icon(Icons.person),
                        label: "Profile",
                        backgroundColor: Colors.white),
                  ],
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
