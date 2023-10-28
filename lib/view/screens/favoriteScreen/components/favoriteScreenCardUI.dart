import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';

class favoriteScreenCardUI extends StatefulWidget {
  const favoriteScreenCardUI({super.key});

  @override
  State<favoriteScreenCardUI> createState() => _favoriteScreenCardUIState();
}

class _favoriteScreenCardUIState extends State<favoriteScreenCardUI> {
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(AppImages.welcomescreenillimage))),
            ),
            SizedBox(
              width: 4.w,
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
                            "Here is the step-by-step guide on how to create a simple booking calendar with your choice.",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.onboardtitle
                                .copyWith(fontSize: 15.sp)),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () async {},
                          child: favorite
                              ? Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )),
                    ],
                  ),
                  Divider(
                    color: AppColors.primarycolors,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 4.w,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text("4.5 (45 reviews)",
                              style: AppStyles.onboardtitle
                                  .copyWith(fontSize: 14.sp))
                        ],
                      ),
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
