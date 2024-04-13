import 'package:flutter/material.dart';
import 'package:e_markting/features/auth/login/view/page/login_page.dart';
import 'package:e_markting/features/auth/Registration/view/page/index.dart';
import 'package:e_markting/features/auth/verfication/view/page/verfication_page.dart';
import 'package:e_markting/features/auth/change%20password/view/page/changepass_page.dart';

void main() {
  MaterialApp materialApp = const MaterialApp(
    //VerficationPage()
    //RegistrationPage()
    //ChangePassPage()
    //LoginPage()
    home: LoginPage(),
  );
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
