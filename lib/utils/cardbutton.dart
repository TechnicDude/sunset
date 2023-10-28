import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';

class ButtonWidgetCard extends StatefulWidget {
  final String? text;
  final Function()? onTap;
  final Color? buttoncolor;
  final Color? buttontextcolor;
  final Color? boardcolor;
  final double? heightbuttom;
  final double? fontsize;
  final String? image;
  final Color? imagecolor;
  const ButtonWidgetCard(
      {Key? key,
      this.text,
      this.onTap,
      this.buttoncolor,
      this.buttontextcolor,
      this.heightbuttom,
      this.boardcolor,
      this.fontsize,
      this.image,
      this.imagecolor})
      : super(key: key);

  @override
  State<ButtonWidgetCard> createState() => _ButtonWidgetCardState();
}

class _ButtonWidgetCardState extends State<ButtonWidgetCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          alignment: Alignment.center,
          height: widget.heightbuttom ?? 16.h,
          width: 90.w,
          decoration: BoxDecoration(
              color: widget.buttoncolor ?? AppColors.primarycolors,
              borderRadius: BorderRadius.circular(2.w),
              border:
                  Border.all(color: widget.boardcolor ?? Colors.transparent)),
          child: Padding(
            padding: EdgeInsets.only(
                left: 2.h, right: 2.h, top: 0.5.h, bottom: 0.5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: SizedBox(
                        height: 7.h,
                        child: Image.asset(widget.image ?? "",
                            color: widget.imagecolor ?? Colors.white))),
                Text(
                  widget.text ?? '',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.onboardtitle.copyWith(
                      color: widget.buttontextcolor ?? Colors.white,
                      fontSize: widget.fontsize ?? 16.sp),
                ),


                //provider, NotifyProvider, notifylistener
                //thickness divider
                Divider(thickness: 23, indent: 20, endIndent: 20,)
                // animation controller
                // animation builder

              ],
            ),
          ),
        ));
  }
}
