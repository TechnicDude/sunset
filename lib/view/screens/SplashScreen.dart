import 'dart:async';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunsetgardenapp/api/locdb.dart';
import 'package:sunsetgardenapp/page_routes/routes.dart';
import 'package:sunsetgardenapp/utils/app_string.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/loaderscreennew.dart';

class SplashScreenACtivity extends StatefulWidget {
  const SplashScreenACtivity({super.key});

  @override
  State<SplashScreenACtivity> createState() => _SplashScreenACtivityState();
}

class _SplashScreenACtivityState extends State<SplashScreenACtivity> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, homePageRoute);
  }

  homePageRoute() async {

    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //       builder: (BuildContext context) => const WelcomeScreenActivity()));
    // }

    String? onboardingScreen;
    await LocDb().isLoggedIn();
    bool check = await LocDb().loginapp;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    onboardingScreen =
        preferences.getString(AppStringFile.onboardingScreen).toString();
    if (check) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.dashBoardScreenActivity, (Route<dynamic> route) => false);
    } else {
      if (onboardingScreen != "0") {
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.onboardingScreen, (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.onboardingScreen, (Route<dynamic> route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Image.asset(
              AppImages.applogo,
              width: 70.w,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 87.h),
            child: SizedBox(
              height: 4.h,
              child: Center(
                child: Image.asset(
                  AppImages.bottomimage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 70.h),
            child: Center(
              child: Image.asset(
                AppImages.splashbottomtwo,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [LoaderScreennew()],
          ),
        ],
      )),
    );
  }
}
