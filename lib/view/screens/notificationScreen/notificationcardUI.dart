import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';

class NotificationCardUIScreenActivity extends StatelessWidget {
  const NotificationCardUIScreenActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.colorgrey, width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(2.w),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 15.w,
              height: 15.w,
              decoration: BoxDecoration(
                color: AppColors.claycardannoc,
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AppImages.announcements)),
              ),
            ),
            SizedBox(
              width: 3.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 70.w,
                    child: Text(
                      "You have appointment with lorem ipsum at 16:00 pm today.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.onboardbody,
                    ),
                  ),
                  SizedBox(
                    height: 0.4.h,
                  ),
                  Text(
                    "Just now",
                    style: AppStyles.onboardtitle.copyWith(fontSize: 13.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
