import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;
  final Function()? onTap;
  const DrawerItem(
      {super.key,
      required this.title,
      required this.icon,
      this.color,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: color ?? AppColors.primarycolors,
            size: 2.5.h,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            title,
            style: AppStyles.onboardtitle.copyWith(fontSize: 15.sp),
          ),
          SizedBox(height: 6.h),
        ],
      ),
    );
  }
}
