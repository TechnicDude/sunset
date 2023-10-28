import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/utils/appbarforall.dart';
import 'package:sunsetgardenapp/view/screens/notificationScreen/notificationcardUI.dart';

class NotificationScreeenActivity extends StatefulWidget {
  const NotificationScreeenActivity({super.key});

  @override
  State<NotificationScreeenActivity> createState() =>
      _NotificationScreeenActivityState();
}

class _NotificationScreeenActivityState
    extends State<NotificationScreeenActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarScreens(
          text: "Notifications",
        ),
        preferredSize: Size(
            MediaQuery.of(context).size.width, AppBar().preferredSize.height),
      ),
      body: Padding(
          padding:
              EdgeInsets.only(top: 1.h, bottom: 2.h, left: 2.w, right: 2.w),
          child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: NotificationCardUIScreenActivity(),
                );
              })),
    );
  }
}
