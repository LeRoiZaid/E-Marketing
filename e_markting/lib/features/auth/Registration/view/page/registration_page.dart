import 'package:flutter/material.dart';
import 'package:e_markting/features/auth/Registration/view/components/registration_bottom.dart';
import 'package:e_markting/features/auth/Registration/view/components/requried_regisgtration_data.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage ({super.key});

  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body:RequriedRegistrationData(),
        bottomNavigationBar: const SizedBox(height: 120,child:  RegistrationBottom(),),
      ),
    );
  }
}