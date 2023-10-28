import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';

class NoDataFoundErrorScreens extends StatelessWidget {
  double? height;
  final String title;
  NoDataFoundErrorScreens({
    super.key,
    this.height,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height != null ? height : 75.h,
        width: 100.w,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.notfound,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                title,
                style: AppStyles.onboardbody
                    .copyWith(color: AppColors.colorgreydark, fontSize: 18.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
