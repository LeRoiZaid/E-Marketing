import 'package:bloc/bloc.dart';
import 'package:e_markting/features/dashboard/controller/dashboard_cubit.dart';
import 'package:e_markting/features/dashboard/modules/product/controller/product_cubit.dart';
import 'package:e_markting/features/dashboard/modules/product/model/repo/database_repo.dart';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

part 'new_product_state.dart';

class NewProductCubit extends Cubit<NewProductState> {
  NewProductCubit() : super(NewProductInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController qntController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  XFile? image;
  Future<void> pickProductImage() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    image = await picker.pickImage(source: ImageSource.gallery);

    emit(NewProductInitial());
  }

  Future<void> takeProductImage() async {
    final ImagePicker picker = ImagePicker();
// take an image.
    image = await picker.pickImage(source: ImageSource.camera);
    emit(NewProductInitial());
  }

  Future<void> addProduct(context) async {
    DatabaseRepo db = DatabaseRepo();
    await db.initDB();
    await db.insertProduct(
      db.myObjectDB, // Pass the Database instance from DatabaseRepo
      nameController.text,
      descController.text,
      int.parse(qntController.text),
      int.parse(qntController.text),
      // Assuming availableQuantity starts from 0
      await image!.readAsBytes(),
      double.parse(priceController.text),
      0, // Assuming initial favorite value is 0
      0, // Assuming initial cart value is 0
    );
    await ProductCubit.instance.init();
  //  DashboardCubit().onChangeTab(0);
  Navigator.pop(context);
//    Navigator.pushNamed(context, 'verfiction', );
  }
}
