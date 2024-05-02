// ignore_for_file: unnecessary_const

// ignore: depend_on_referenced_packages
import 'package:device_preview/device_preview.dart';
import 'package:e_markting/dashboard/view/page/dashboard_page.dart';
import 'package:e_markting/features/auth/onboarding/view/page/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:e_markting/features/auth/login/view/page/login_page.dart';
import 'package:e_markting/features/auth/Registration/view/page/index.dart';
import 'package:e_markting/features/auth/verfication/view/page/verfication_page.dart';
import 'package:e_markting/features/auth/change%20password/view/page/changepass_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool onBording = sharedPreferences.getBool('OnBoardingPage') ?? false;

 

MaterialApp materialApp = MaterialApp(
   builder:DevicePreview.appBuilder,
    useInheritedMediaQuery: true,
    onGenerateRoute: MyRoutes.onGenerateRoute,
    onGenerateInitialRoutes: (_) => MyRoutes.initRoutes,
);

    //VerficationPage()
    //RegistrationPage()
    //ChangePassPage()
    //LoginPage()
  runApp(  DevicePreview(
      enabled: false,
      builder: (context) => materialApp, // Wrap your app
    ),);
}

class MyRoutes {
  static List<Route> initRoutes = [
    MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => const DashbordPage(),
      //builder: (BuildContext context) => const OnBoardingPage(),
    ),
  ];
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login':
        final List data = settings.arguments as List;
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => LoginPage(),
        );
      case 'registration':
        final List data = settings.arguments as List;
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) =>RegistrationPage(),
        );
      case 'verfiction':
        final List data = settings.arguments as List;
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => VerificationPage(),
        );
      case 'change password':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const ChangePassPage(),
        );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const OnBoardingPage(),
        );
    }
  }
}
