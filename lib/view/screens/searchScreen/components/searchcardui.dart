import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';

class HomeSearchScreenActivityCard extends StatefulWidget {
  const HomeSearchScreenActivityCard({super.key});

  @override
  State<HomeSearchScreenActivityCard> createState() =>
      _HomeSearchScreenActivityCardState();
}

class _HomeSearchScreenActivityCardState
    extends State<HomeSearchScreenActivityCard> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.colorgreycard,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.only(top: 1.h, bottom: 1.h, left: 2.w, right: 2.w),
        child: Row(
          children: [
            Container(
              height: 20.w,
              width: 20.w,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(AppImages.demo))),
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 50.w,
                        child: Text(
                          "Cleaning services is the good dummy search text...",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              AppStyles.onboardtitle.copyWith(fontSize: 15.sp),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () async {},
                          child: favorite
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                )),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.primarycolors,
                            size: 4.w,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "4.5 (35 reviews)",
                            style: AppStyles.onboardbody.copyWith(
                                color: AppColors.colorgreydark,
                                fontSize: 14.sp),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.primarycolors,
                            size: 4.w,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "Noida",
                            style: AppStyles.onboardbody.copyWith(
                                color: AppColors.colorgreydark,
                                fontSize: 14.sp),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
