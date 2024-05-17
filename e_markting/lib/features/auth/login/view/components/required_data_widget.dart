import 'package:e_markting/core/esmail_textfield_state.dart';
import 'package:e_markting/core/validation.dart';
import 'package:e_markting/features/auth/login/controller/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequiredDataWidget extends StatelessWidget {
  RequiredDataWidget({super.key, required this.controller});
  Image image = Image(
    image: AssetImage('assets/images/logo.png'),
    height: 100,
    width: 100,
  );

  final LoginCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<LoginCubit, RegistrationState>(
        builder: (context, state) {
          LoginCubit controller = context.read<LoginCubit>();

          return Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),

                const Spacer(),
                image,
                const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Spacer(),

                ///mail
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EsmailTextField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.mailController,
                    keyboardType: TextInputType.name,
                    validator: MyValidation().nameValidate,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined)),
                  ),
                ),

                ///password

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EsmailTextField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.passwordController,
                    keyboardType: TextInputType.name,
                    validator: MyValidation().passwordValidate,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.remove_red_eye),
                        prefixIcon: const Icon(Icons.password),
                        hintText: 'Password'),
                    obscureText: true,

                  ),
                ),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
