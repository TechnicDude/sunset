import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';

class DialogHelper {
  static void hideLoading() {}

  static Future<void> showFlutterToast({required String strMsg}) async {
    await Fluttertoast.showToast(msg: strMsg);
  }

  shoppopDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          "Alert!",
          style: AppStyles.onboardtitle
              .copyWith(fontSize: 18.sp, color: AppColors.blackColor),
        ),
        content: Text("Internet not available",
            style: AppStyles.onboardbody.copyWith(fontSize: 17.sp)),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(
              "OK",
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
