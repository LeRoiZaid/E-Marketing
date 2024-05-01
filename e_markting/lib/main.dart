// ignore_for_file: unnecessary_const

import 'package:e_markting/features/auth/onboarding/view/page/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:e_markting/features/auth/login/view/page/login_page.dart';
import 'package:e_markting/features/auth/Registration/view/page/index.dart';
import 'package:e_markting/features/auth/verfication/view/page/verfication_page.dart';
import 'package:e_markting/features/auth/change%20password/view/page/changepass_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {

/*  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool onBording = sharedPreferences.getBool('OnBoardingPage') ?? false;*/

 

MaterialApp materialApp = MaterialApp(
  //home:  onBording ? const RegistrationPage() : const OnBoardingPage()
  home:OnBoardingPage(),
);

    //VerficationPage()
    //RegistrationPage()
    //ChangePassPage()
    //LoginPage()
  runApp(materialApp);
}

/*class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}*/
