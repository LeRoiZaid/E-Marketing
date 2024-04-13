import 'package:flutter/material.dart';
import 'package:e_markting/core/validation.dart';

// ignore_for_file: annotate_overrides

// ignore_for_file: must_be_immutable


class RequriedVerfictionData extends StatelessWidget {
   RequriedVerfictionData({super.key});

  
  Widget build(BuildContext context) {
    return Column(
      
    
    // mainAxisAlignment: MainAxisAlignment.center,
      children: [
      const SizedBox(height: 200),
        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR10F2IoAY9w-UygCY-FOLgWtwCbW1TbBwUuXPnOb1aIg&s",height: 100,width: 100,),
            const Text("Verfiction Code",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
        const SizedBox(height: 40),
    
          ///Email
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: TextEditingController(),
          keyboardType: TextInputType.number,
          validator: MyValidation().VerficationCode,
          decoration: decoration.copyWith(hintText: 'Verification code must be 6 digits.'),
        ),
        //const SizedBox(height: 30),
        ///Password
    
      ],
    );
  }

  InputDecoration decoration = InputDecoration(
      //label: Text("Password"),
      floatingLabelBehavior: FloatingLabelBehavior.always,    
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orange, width: 5),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 17, 0, 255), width: 5),
          borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 243, 2, 2), width: 5),
          borderRadius: BorderRadius.circular(10)));
}
