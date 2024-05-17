import 'dart:typed_data';

import 'package:e_markting/core/esmail_textfield_state.dart';
import 'package:e_markting/features/auth/Registration/controller/cubit/registration_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_markting/core/validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore_for_file: annotate_overrides

// ignore_for_file: must_be_immutable

class RequriedRegistrationData extends StatelessWidget {
  RequriedRegistrationData({super.key, required this.controller});
  final RegistrationCubit controller;
  Image image = Image(
    image: AssetImage('assets/images/logo.png'),
    height: 100,
    width: 100,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          final RegistrationCubit controller =
              context.read<RegistrationCubit>();

          
          return Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  image,
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  ///Frist Name

                  EsmailTextField(
                      controller: controller.UserNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          hintText: 'User Name')),

                  const SizedBox(height: 20),

                  ///Email
                  EsmailTextField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.EmailController,
                    keyboardType: TextInputType.name,
                    validator: MyValidation().nameValidate,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined)),
                  ),
                  const SizedBox(height: 20),

                  ///Password
                  EsmailTextField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.PasswordController,
                    keyboardType: TextInputType.name,
                    validator: MyValidation().passwordValidate,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.remove_red_eye),
                        prefixIcon: const Icon(Icons.password),
                        hintText: 'Password'),
                    obscureText: true,
                  
                  ),
                  const SizedBox(height: 20),

                  ///Confirm Password
                  EsmailTextField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.ConfirmPassController,
                    keyboardType: TextInputType.name,
                    validator: MyValidation().passwordValidate,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.remove_red_eye),
                        prefixIcon: const Icon(Icons.password),
                        hintText: 'Confirm Password'),
                    obscureText: true,
                
                  )
                ],
              ));
        },
      ),
    );
  }
}
