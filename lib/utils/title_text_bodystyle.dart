import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';

class TitleTextbodyStyle extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxline;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  const TitleTextbodyStyle({
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: style ?? AppStyles.onboardbody.copyWith(fontSize: 16.sp),
          maxLines: maxline ?? 1,
          overflow: textOverflow,
          textDirection: textDirection,
        ),
      ],
    );
  }
}
