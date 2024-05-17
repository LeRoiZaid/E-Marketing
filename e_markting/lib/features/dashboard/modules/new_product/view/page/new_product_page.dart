import 'dart:io';

import 'package:e_markting/core/esmail_textfield_state.dart';
import 'package:e_markting/features/dashboard/modules/new_product/cubit/new_product_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewProductPage extends StatelessWidget {
  NewProductPage({Key? key}) : super(key: key);
  Image image = Image(
    image: AssetImage('assets/images/logo.png'),
    height: 150,
    width: 200,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewProductCubit(),
      child: BlocBuilder<NewProductCubit, NewProductState>(
        builder: (context, state) {
           final NewProductCubit cubit = context.read<NewProductCubit>();
           var x=const TextStyle(
    fontSize: 18,
    color: Colors.blue, // لون النص الأساسي
    fontWeight: FontWeight.bold, // سمك الخط
    fontStyle: FontStyle.italic, // نمط الخط
  );
       var c = ButtonStyle(
  
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
     InputDecoration decoration = InputDecoration(
            hintStyle: const TextStyle(
          color: Color.fromARGB(255, 78, 115, 144), // لون النص التلميحي
            fontStyle: FontStyle.italic, // نمط الخط للنص التلميحي
          ),
          
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: Colors.blue[700]!), // Adjusted color
            ),
            filled: true,
            fillColor: Colors.blue[50], // Adjusted color
            contentPadding: EdgeInsets.all(16),
          );
            return Scaffold(
            appBar: AppBar(
              title: const Text('Add New Product',style: TextStyle(
    fontSize: 20,
    color: Color.fromARGB(197, 0, 0, 0), // لون النص الأساسي
    fontWeight: FontWeight.bold, // سمك الخط
  
               ),),
              backgroundColor: Colors.blue[700], // Adjusted color
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: image,
                      ),
                    ],
                  ),
                  Text('Name', style: x),
                  EsmailTextField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.name,
                    controller: cubit.nameController,
                    decoration: decoration.copyWith(
                    hintText: 'Enter Product Name'),
                  ),
                  SizedBox(height: 16),
                  Text('Description', style: x),
                  EsmailTextField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    expands:true,
                    controller: cubit.descController,
                    decoration: decoration.copyWith(
                    alignLabelWithHint:false,  
                   contentPadding: EdgeInsets.symmetric(vertical: 30),
                    hintText: 'Enter Product '),
                  ),
                  SizedBox(height: 16),
                  Text('Available Count', style: x),
                  EsmailTextField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    controller: cubit.qntController,
                    decoration: decoration.copyWith(
                    hintText: 'Enter Available Count'),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: cubit.pickProductImage,
                        icon: Icon(CupertinoIcons.photo, size: 32),
                        color: Colors.blue[700], // Adjusted color
                      ),Text('OR', style: x),
                      IconButton(
                        onPressed: cubit.takeProductImage,
                        icon: Icon(CupertinoIcons.camera, size: 32),
                        color: Colors.blue[700], // Adjusted color
                      ),
                    ],
                  ),
                  if (cubit.image != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(cubit.image!.path),
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => cubit.addProduct(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Add Product",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    style: c, // Using the local variable
                  ),
                    SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Cancle",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    style: c, // Using the local variable
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
