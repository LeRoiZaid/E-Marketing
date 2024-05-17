import 'package:e_markting/features/auth/Registration/controller/cubit/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:e_markting/features/auth/Registration/view/components/registration_bottom.dart';
import 'package:e_markting/features/auth/Registration/view/components/requried_regisgtration_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<RegistrationCubit>(
        create: (context) => RegistrationCubit(),
        child: BlocBuilder<RegistrationCubit, RegistrationState>(
          builder: (context, state) {
            final RegistrationCubit controller = context.read<RegistrationCubit>();
            return Scaffold(
            /*  appBar: AppBar(
                
              ),*/
              body: ListView(
                padding: EdgeInsets.all(20.0),
                children: [
                  RequriedRegistrationData(
                    controller: controller,
                  ),
                  SizedBox(height:25),
                  RegistrationBottom(
                  controller: controller,
                ),
                ],
              ),
          
            );
          },
        ),
      ),
    );
  }
}
