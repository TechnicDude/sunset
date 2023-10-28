import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';

class ButtonWidget extends StatefulWidget {
  final String? text;
  final Function()? onTap;
  const ButtonWidget({
    Key? key,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          alignment: Alignment.center,
          height: 6.h,
          decoration: BoxDecoration(
            color: AppColors.primarycolors,
            borderRadius: BorderRadius.circular(1.h),
          ),
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(left: 2.w, right: 2.w),
            child: Text(
              widget.text ?? '',
              style: AppStyles.onboardsubtitle.copyWith(
                  color: Colors.white,
                  fontSize: 16.5.sp,
                  fontWeight: FontWeight.bold),
            ),
          )),
        ));
  }
}
