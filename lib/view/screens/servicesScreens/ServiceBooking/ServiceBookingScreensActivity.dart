import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appbarforall.dart';
import 'package:sunsetgardenapp/utils/buttons/button_widget.dart';
import 'package:sunsetgardenapp/view/screens/homedashboard/sliderscreen.dart';

class ServiceBookingScreensActivity extends StatefulWidget {
  const ServiceBookingScreensActivity({super.key});

  @override
  State<ServiceBookingScreensActivity> createState() =>
      _ServiceBookingScreensActivityState();
}

class _ServiceBookingScreensActivityState
    extends State<ServiceBookingScreensActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            text: "Cleaning",
          )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 3.w, right: 3.w),
          child: Column(
            children: [
              //  SliderScreen(),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w),
                child: Column(
                  children: [
                    ButtonWidget(
                      text: "Book Now",
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    ButtonWidget(
                      text: "Chat with operator",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
