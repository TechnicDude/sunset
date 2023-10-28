import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunsetgardenapp/page_routes/routes.dart';
import 'package:sunsetgardenapp/provider/DashboardServicesProvider.dart';
import 'package:sunsetgardenapp/provider/profileprovider.dart';
import 'package:sunsetgardenapp/utils/app_string.dart';
import 'package:sunsetgardenapp/view/screens/OnBoardingScreen/onboarding_screen.dart';
import 'package:sunsetgardenapp/view/screens/OnBoardingScreen/welcomescreen.dart';
import 'package:sunsetgardenapp/view/screens/SettingsScreen/components/WebviewWidgetUIScreen.dart';
import 'package:sunsetgardenapp/view/screens/SettingsScreen/settingscreenActivity.dart';
import 'package:sunsetgardenapp/view/screens/favoriteScreen/favoriteScreenActivity.dart';
import 'package:sunsetgardenapp/view/screens/homedashboard/bottomdashborad.dart';
import 'package:sunsetgardenapp/view/screens/loginscreen/changenewpassword.dart';
import 'package:sunsetgardenapp/view/screens/loginscreen/changepassword.dart';
import 'package:sunsetgardenapp/view/screens/loginscreen/forgotpassword.dart';
import 'package:sunsetgardenapp/view/screens/SplashScreen.dart';
import 'package:sunsetgardenapp/view/screens/loginscreen/loginscreen.dart';
import 'package:sunsetgardenapp/view/screens/loginscreen/loginselectScreen.dart';
import 'package:sunsetgardenapp/view/screens/loginscreen/otpcodeverification.dart';
import 'package:sunsetgardenapp/view/screens/loginscreen/signupscreen.dart';
import 'package:sunsetgardenapp/view/screens/notificationScreen/notification.dart';
import 'package:sunsetgardenapp/view/screens/profileScreen/editProfileScreenActivity.dart';
import 'package:sunsetgardenapp/view/screens/profileScreen/profileScreenActivity.dart';
import 'package:sunsetgardenapp/view/screens/searchScreen/searchScreenActivity.dart';
import 'package:sunsetgardenapp/view/screens/servicesScreens/ServiceBooking/ServiceBookingScreensActivity.dart';
import 'package:sunsetgardenapp/view/screens/servicesScreens/servicesScreenActivity.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    Widget widgetScreen;
    switch (settings.name) {
      case Routes.splashScreen:
        widgetScreen = SplashScreenACtivity();
        break;

      case Routes.onboardingScreen:
        widgetScreen = const OnboardingScreen();
        break;
      case Routes.welcomeScreen:
        widgetScreen = const WelcomeScreenActivity();
        break;
      case Routes.loginintroScreen:
        widgetScreen = LoginSelectScreenActivity();
        break;
      case Routes.signupscreen:
        widgetScreen = SignupScreenActivity();
        break;
      case Routes.loginScreen:
        widgetScreen = LoginScreenActivity();
        break;
      case Routes.forgetPassword:
        widgetScreen = ForgotPassword();
        break;
      case Routes.otpVerify:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = OtpVerify(
          pagetype: args[AppStringFile.pagetype],
          email: args[AppStringFile.email],
        );
        break;

      case Routes.changePassword:
        widgetScreen = const ChangePasswordScreenActivity();
        break;

      case Routes.changenewPassword:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangenewPasswordScreenActivity(
          userid: args[AppStringFile.userid],
          email: args[AppStringFile.email],
          otp: args[AppStringFile.otp],
        );
        break;

      case Routes.dashBoardScreenActivity:
        widgetScreen = const DashBoardScreenActivity();
        break;

      case Routes.webviewWidgetUIScreen:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = WebviewWidgetUIScreen(
          url: args[AppStringFile.url],
          text: args[AppStringFile.title],
        );
        break;
      case Routes.settingScreenActivity:
        widgetScreen = const SettingScreenActivity();
        break;

      case Routes.notification:
        widgetScreen = const NotificationScreeenActivity();
        break;

      case Routes.profileScreenActivity:
        widgetScreen = ChangeNotifierProvider<ProfileUserProvider>(
            create: (BuildContext context) => ProfileUserProvider(),
            child: const ProfileScreenActivity());
        break;

      case Routes.editProfile:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangeNotifierProvider<ProfileUserProvider>(
            create: (BuildContext context) => ProfileUserProvider(),
            child: EditProfile(
              profileuserdata: args[AppStringFile.profileuserdata],
            ));
        break;

      case Routes.servicesScreenActivity:
        widgetScreen = ChangeNotifierProvider<DashBoradServicesProvider>(
            create: (BuildContext context) => DashBoradServicesProvider(),
            child: ServicesScreenActivity());
        break;

      case Routes.serviceBookingScreensActivity:
        widgetScreen = ServiceBookingScreensActivity();
        break;

      case Routes.searchScreentActivity:
        widgetScreen = SearchScreentActivity();
        break;
      case Routes.favoriteScreenActivity:
        widgetScreen = FavoriteScreenActivity();
        break;

      default:
        widgetScreen = const SplashScreenACtivity();
    }
    return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => widgetScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }

  static Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('ERROR'),
      ),
    );
  }
}
