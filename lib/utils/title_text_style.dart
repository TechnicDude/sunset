import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';

class TitleTextStyle extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxline;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  const TitleTextStyle({
    Key? key,
    this.style,
    this.textAlign,
    this.maxline,
    this.textOverflow,
    required this.text,
    this.textDirection,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? AppStyles.onboardtitle.copyWith(fontSize: 17.sp),
      textAlign: textAlign,
      maxLines: maxline ?? 1,
      overflow: textOverflow,
      textDirection: textDirection,
    );
  }
}
