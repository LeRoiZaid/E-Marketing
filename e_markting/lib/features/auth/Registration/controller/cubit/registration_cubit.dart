import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import 'package:flutter/material.dart';

part 'registration_state.dart';


class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());
  TextEditingController UserNameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController ConfirmPassController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    void onPressedConfirmButton(BuildContext context) {
    if (formKey.currentState!.validate()) {
   // ignore: prefer_typing_uninitialized_variables
  
   Navigator.pushNamed(context, 'verfiction',
    arguments: [
    UserNameController.text,
      ]);
  log( UserNameController.text);
  log(  EmailController .text);
  log( PasswordController.text); 
  log( ConfirmPassController.text); 
    
    
    
    } else {
      log('invalid inputs');
    }
  }
}
