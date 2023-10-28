import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';

class HomeContainerCardTwo extends StatefulWidget {
  final String? image;
  final String? text;
  final Color? boxcolor;
  final Color? textcolor;
  final double? height;
  final double? width;
  final Function()? onTap;
  const HomeContainerCardTwo(
      {this.image,
      this.text,
      this.onTap,
      this.boxcolor,
      this.textcolor,
      this.height,
      this.width,
      super.key});

  @override
  State<HomeContainerCardTwo> createState() => _HomeContainerCardTwoState();
}

class _HomeContainerCardTwoState extends State<HomeContainerCardTwo> {
  @override
  Widget build(BuildContext context) {
    Color baseColor = AppColors.primarycolors.withOpacity(0.7);

    return Padding(
      padding: EdgeInsets.only(left: 1.w, right: 1.w),
      child: InkWell(
        onTap: widget.onTap,
        child: Column(
          children: [

            // ClayContainer(
            //   height: widget.height ?? 25.w,
            //   width: widget.width ?? 25.w,
            //   color: widget.boxcolor ?? baseColor,
            //   child: Padding(
            //       padding: EdgeInsets.all(1.h),
            //       child: Center(child: Image.asset(widget.image ?? ""))),
            // ),
            //

            Container(
              height: widget.height ?? 24.w,
              width: widget.width ?? 24.w,
              decoration: BoxDecoration(
                color: widget.boxcolor ?? baseColor,
                borderRadius: BorderRadius.all(Radius.circular(1.w)),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.colorgrey,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(1, 2),
                  ),
                ],
              ),
              child: Padding(
                  padding: EdgeInsets.all(1.8.h),
                  child: Center(child: Image.asset(widget.image ?? ""))),
            ),

            Padding(
              padding: EdgeInsets.all(2.w),
              child: SizedBox(
                width: 25.w,
                height: 9.w,
                child: Text(
                  widget.text ?? ''.toUpperCase(),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.onboardtitle.copyWith(
                    //fontWeight: FontWeight.bold,
                    fontSize: 14.6.sp,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
