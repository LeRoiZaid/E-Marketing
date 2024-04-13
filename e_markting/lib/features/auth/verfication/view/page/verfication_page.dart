import 'package:flutter/material.dart';
import 'package:e_markting/features/auth/verfication/view/components/index.dart';
import 'package:e_markting/features/auth/verfication/view/components/required_verfiction_data.dart';



class VerficationPage extends StatelessWidget {
  const VerficationPage ({super.key});

  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        
          
              body:RequriedVerfictionData(),
          bottomNavigationBar: const SizedBox(height: 250,child:  VerficationBottom(),),
          

      
      ),
    );
  }
}