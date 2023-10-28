import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/api/api.dart';
import 'package:sunsetgardenapp/model/DashboardServicesModel.dart';
import 'package:sunsetgardenapp/page_routes/routes.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appimages.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';

class HomeServiceContainerCard extends StatelessWidget {
  final String? image;
  final String? text;
  final Color? boxcolor;
  final Color? textcolor;
  final double? height;
  final double? width;
  final Function()? onTap;
  final List<ServicesData>? servicelistdata;
  final String type;
  final String searchString;

  const HomeServiceContainerCard(
      {this.image,
      this.text,
      this.onTap,
      this.boxcolor,
      this.textcolor,
      this.height,
      this.width,
      required this.servicelistdata,
      required this.type,
      required this.searchString,
      super.key});

  @override
  Widget build(BuildContext context) {
    Color baseColor = AppColors.primarycolors;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.serviceBookingScreensActivity);
      },
      child: SizedBox(
          height: 23.h,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: servicelistdata!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 1.w,
                  right: 1.w,
                  top: 3.h,
                ),
                child: InkWell(
                  onTap: onTap,
                  child: Column(
                    children: [
                      Container(
                        height: height ?? 25.w,
                        width: width ?? 25.w,
                        decoration: BoxDecoration(
                          color: Color(servicelistdata![index]
                                  .colour
                                  .toString()
                                  .hashCode)
                              .withOpacity(0.5), // boxcolor ?? baseColor,
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
                          padding: EdgeInsets.all(1.5.h),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: servicelistdata![index].image != null
                                      ? NetworkImage(APIURL.imageurl +
                                          servicelistdata![index].image!)
                                      : AssetImage(AppImages.services)
                                          as ImageProvider,
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SizedBox(
                          width: 24.w,
                          child: Text(
                            servicelistdata![index] != null
                                ? servicelistdata![index].serviceName!
                                : '',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.onboardtitle.copyWith(
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
