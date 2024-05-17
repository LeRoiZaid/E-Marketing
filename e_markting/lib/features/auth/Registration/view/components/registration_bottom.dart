import 'package:e_markting/features/auth/Registration/controller/cubit/registration_cubit.dart';
import 'package:e_markting/features/auth/login/view/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationBottom extends StatelessWidget {
  RegistrationBottom({Key? key, required this.controller}) : super(key: key);

  final RegistrationCubit controller;
   var x=const TextStyle(
    fontSize: 18,
    color: Colors.blue, // لون النص الأساسي
    fontWeight: FontWeight.bold, // سمك الخط
    fontStyle: FontStyle.italic, // نمط الخط
  );
  var c = ButtonStyle(
     fixedSize: MaterialStateProperty.all<Size>(
      Size(250, 60), // ضع هنا الطول والعرض المطلوبين
    ),
/*  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
    EdgeInsets.symmetric(vertical: 20),
  ),*/
backgroundColor: MaterialStateProperty.all<Color>(
    Colors.blue[700]!,
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  elevation: MaterialStateProperty.all<double>(10),
);
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          final RegistrationCubit controller = context.read<RegistrationCubit>();

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 0, left: 0),
                child: ElevatedButton(
                  onPressed: () => controller.onPressedConfirmButton(context),
                  
                      // ignore: sort_child_properties_last
                      child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    style: c, // Using the local variable
                  ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "have an account ? ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
                      // الإجراء الذي تريد تنفيذه عند الضغط
                      // مثلاً فتح شاشة تسجيل الدخول
                    },
                    child: const Text(
                      "login",
                      style:  TextStyle(
                        color: Color.fromARGB(255, 126, 117, 231),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationThickness: 3,
                        decorationColor: Color.fromARGB(255, 22, 2, 248),
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
