//import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';

class ContainerCardWidget extends StatefulWidget {
  final String? image;
  final String? text;
  final Color? boxcolor;
  final Color? textcolor;
  final double? height;
  final double? width;
  final Function()? onTap;
  const ContainerCardWidget(
      {this.image,
      this.text,
      this.onTap,
      this.boxcolor,
      this.textcolor,
      this.height,
      this.width,
      super.key});

  @override
  State<ContainerCardWidget> createState() => _ContainerCardWidgetState();
}

class _ContainerCardWidgetState extends State<ContainerCardWidget> {
  @override
  Widget build(BuildContext context) {
    Color baseColor = AppColors.colorgreycard;
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        children: [
          // ClayContainer(
          //   height: widget.height ?? 25.w,
          //   width: widget.width ?? 25.w,
          //   color: widget.boxcolor ?? baseColor,
          //   child: Padding(
          //     padding: EdgeInsets.all(1.h),
          //     child: Center(child: Image.asset(AppImages.logobanner)
          //         //  ClayText(widget.text ?? ''.toUpperCase(),
          //         //     emboss: true, size: 18.sp),
          //         ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 25.w,
              child: Text(
                widget.text ?? ''.toUpperCase(),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.onboardtitle.copyWith(fontSize: 16.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
