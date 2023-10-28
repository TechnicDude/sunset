import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/page_routes/route_generate.dart';
import 'package:sunsetgardenapp/page_routes/routes.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return StreamProvider<InternetConnectionStatus>(
        initialData: InternetConnectionStatus.connected,
        create: (_) {
          return InternetConnectionChecker().onStatusChange;
        },
        child: MaterialApp(
          builder: (context, child) {
            return MediaQuery(
              child: child!,
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            );
          },
          title: 'Sunset Garden App',
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splashScreen,
          onGenerateRoute: RouteGenerator.generateRoute,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                secondary: AppColors.primarycolors,
              ),
              scaffoldBackgroundColor: AppColors.colorswhite,
              fontFamily: 'Poppins',
              appBarTheme: AppBarTheme(elevation: 0, centerTitle: true)),
        ),
      );
    });
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);
