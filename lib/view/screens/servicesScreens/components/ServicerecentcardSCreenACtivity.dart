import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/view/screens/servicesScreens/components/servicecardui.dart';

class ServicerecentcardSCreenActivity extends StatefulWidget {
  const ServicerecentcardSCreenActivity({super.key});

  @override
  State<ServicerecentcardSCreenActivity> createState() =>
      _ServicerecentcardSCreenActivityState();
}

class _ServicerecentcardSCreenActivityState
    extends State<ServicerecentcardSCreenActivity> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: 1.h,
          bottom: 1.h,
        ),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ServicerecentcardUI(),
              );
            }));
  }
}
