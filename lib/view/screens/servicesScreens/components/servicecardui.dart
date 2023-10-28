import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/page_routes/routes.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';
import 'package:sunsetgardenapp/utils/buttons/button_widget_cou.dart';

class ServicerecentcardUI extends StatelessWidget {
  const ServicerecentcardUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          color: AppColors.colorgreycard),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.colorgrey, width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(2.w),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 16.w,
                          width: 16.w,
                          decoration: BoxDecoration(
                            color: AppColors.claycardannoc.withOpacity(0.6),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.w)),
                            boxShadow: const [
                              BoxShadow(
                                color: AppColors.colorgrey,
                                spreadRadius: 0.5,
                                blurRadius: 0.5,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(1.5.h),
                              child: Center(
                                  child: Image.asset(AppImages.cafeteria))),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        SizedBox(
                          width: 30.w,
                          child: Text(
                            "Repairs and Maintence",
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.onboardtitle
                                .copyWith(fontSize: 15.sp),
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          width: 25.w,
                          child: ButtonWidgetCou(
                            heightbuttom: 3.5.h,
                            buttoncolor: Colors.transparent,
                            buttontextcolor: AppColors.primarycolors,
                            boardcolor: AppColors.primarycolors,
                            text: "Book Again",
                            fontsize: 14.sp,
                            onTap: () {
                              // Navigator.pushNamed(context, Routes.dashBoardScreenActivity);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
