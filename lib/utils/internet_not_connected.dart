import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';

class InternetNotAvailable extends StatelessWidget {
  double? height;
  InternetNotAvailable({Key? key, double? height});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height != null ? height : 55.h,
        width: 70.w,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
                child: Image.asset(AppImages.nointernet,
                    color: AppColors.colorgrey.withOpacity(0.9)),
              ),
              Text(
                "You'r offline",
                style: AppStyles.onboardbody
                    .copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Oops, there is something problem with your network or the server is currently down, please try it again later.',
                textAlign: TextAlign.center,
                style: AppStyles.onboardsubtitle.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.blackColor.withOpacity(0.7)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
