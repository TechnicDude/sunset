import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunsetgardenapp/utils/app_string.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';

class AppHelper {
  String greeting() {
    var hour = DateTime.now().hour;

    if (hour >= 12 && hour < 17) {
      return 'Afternoon🌞';
    } else if (hour >= 17 && hour < 21) {
      return "Evening🌙";
    } else if (hour >= 21 && hour < 3) {
      return "Night🌜";
    } else {
      return 'Morning☀️';
    }
  }

  static String? userid;
  static String? AUTH_TOKEN_VALUE;
  static String? email_VALUE;
  static String? language;
  static String? role;
  static String? _url;
  static String? image;
  static String? firstName;
  static String? lastName;
  static String? phoneNumber;
  static String? userAvatar;
  static bool themelight = true;

  static logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    sharedPreferences.setString(AppStringFile.onboardingScreen, "0");
    userid = null;
  }

  Future<void> dialogBuilder(
      BuildContext context, String title, String message) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(
            message,
            style: AppStyles.onboardbody.copyWith(fontSize: 17.sp),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(textStyle: AppStyles.onboardbody),
              child: Text(
                'OK',
                style: AppStyles.onboardtitle.copyWith(fontSize: 17.sp),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> dialogBuilderforget(
      BuildContext context, String title, String message) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(
            message,
            style: AppStyles.onboardbody.copyWith(fontSize: 16.sp),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                'OK',
                style: AppStyles.onboardtitle.copyWith(fontSize: 17.sp),
              ),
              onPressed: () {
                Navigator.pop(context);

                // Navigator.pop(context);
                //  Navigator.pushNamed(context, Routes.otpVerify, arguments: {
                //   AppStringFile.email: email,
                //   AppStringFile.pagetype: AppStringFile.forgot_password,
                //   // StringFile.id: response['user']['id'],
                // });
              },
            ),
          ],
        );
      },
    );
  }
}
