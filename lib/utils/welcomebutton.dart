import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';

class WelcomeButtonWidget extends StatefulWidget {
  final String? image;
  final String? text;
  final Color? boxcolor;
  final Color? textcolor;
  final double? width;
  final Function()? onTap;
  const WelcomeButtonWidget({
    Key? key,
    this.image,
    this.text,
    this.onTap,
    this.boxcolor,
    this.textcolor,
    this.width,
  }) : super(key: key);

  @override
  State<WelcomeButtonWidget> createState() => _WelcomeButtonWidgetState();
}

class _WelcomeButtonWidgetState extends State<WelcomeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 6.h,
        width: widget.width ?? 100.w,
        decoration: BoxDecoration(
            color: widget.boxcolor ?? AppColors.primarycolors,
            border: Border.all(
              color: AppColors.primarycolors,
            ),
            borderRadius: BorderRadius.circular(2.w)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text ?? ''.toUpperCase(),
              style: AppStyles.onboardtitle.copyWith(
                  color: widget.textcolor ?? Colors.white, fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
