import 'package:e_markting/core/context.dart';
import 'package:e_markting/features/auth/Registration/view/page/registration_page.dart';
import 'package:e_markting/features/auth/change%20password/view/page/ChangePass_page.dart';
import 'package:e_markting/features/auth/login/controller/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationWidget extends StatelessWidget {
  BottomNavigationWidget({Key? key, required this.controller});

  final LoginCubit controller;
  var c = ButtonStyle(
      fixedSize: MaterialStateProperty.all<Size>(
    Size(250, 60), // ضع هنا الطول والعرض المطلوبين
  ));
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<LoginCubit, RegistrationState>(
        builder: (context, state) {
          final LoginCubit controller = context.read<LoginCubit>();

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 0,
                  left: 0,
                ),
                child: ElevatedButton(
                  onPressed: () => controller.onPressedConfirmButton(context),
                
                  
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),  style: c,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "have no account ? ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RegistrationPage()));
                    },
                    child: const Text(
                      "Registration",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue, // لون النص الأساسي
                        fontWeight: FontWeight.bold, // سمك الخط
                        fontStyle: FontStyle.italic, // نمط الخط
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Forget Password ? ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ChangePassPage()));
                    },
                    child: const Text(
                      "Change Password",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue, // لون النص الأساسي
                        fontWeight: FontWeight.bold, // سمك الخط
                        fontStyle: FontStyle.italic, // نمط الخط
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
