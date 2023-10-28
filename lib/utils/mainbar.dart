import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';

class MainBar extends StatelessWidget {
  final String? image;
  final String? text;
  final String? subtext;
  const MainBar({
    Key? key,
    this.image,
    this.text,
    this.subtext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 2.h,
        ),
        SizedBox(
          height: 8.h,
          child: Center(
            child: Image.asset(
              image ?? '',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          text ?? '',
          style: AppStyles.onboardtitle
              .copyWith(fontSize: 20.sp, color: AppColors.primarycolors),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          subtext ?? '',
          style: AppStyles.onboardsubtitle.copyWith(fontSize: 15.5.sp),
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}
