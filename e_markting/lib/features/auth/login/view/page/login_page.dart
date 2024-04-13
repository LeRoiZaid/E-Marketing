import 'package:flutter/material.dart';
import 'package:e_markting/features/auth/Login/view/components/login_bottom.dart';
import 'package:e_markting/features/auth/login/view/components/requried_login_data.dart';


class LoginPage extends StatelessWidget {
  const LoginPage ({super.key});

  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body:RequriedLoginData(),
        bottomNavigationBar: const SizedBox(height: 200,child:  LoginBottom(),),
      ),
    );
  }
}