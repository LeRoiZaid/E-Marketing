import 'package:e_markting/core/esmail_textfield_state.dart';
import 'package:e_markting/core/validation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:e_markting/core/my_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool onBording = sharedPreferences.getBool('OnBoardingPage') ?? false;

  // تعريف الـ controller هنا
  TextEditingController controller = TextEditingController();

  MaterialApp materialApp = MaterialApp(
    themeMode: ThemeMode.light,
  //  theme: ,
    //darkTheme: ,
    builder: DevicePreview.appBuilder,
    useInheritedMediaQuery: true,
    onGenerateRoute: MyRoutes.onGenerateRoute,
    onGenerateInitialRoutes: (_) => MyRoutes.initRoutes(onBording),
    
  
  );

  runApp(DevicePreview(
    enabled:false,
    builder: (context) => materialApp, // Wrap your app
  ));
}/*import 'dart:typed_data';
import 'package:e_markting/features/dashboard/modules/product/controller/product_cubit.dart';
import 'package:e_markting/features/dashboard/modules/product/model/entity_model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    Key? key, // تصحيح في الباراميتر الخاص بالمفتاح
    required this.productModel,
    required this.controller,
  }) : super(key: key); // تصحيح في استدعاء super

  final ProductModel productModel;
  final ProductCubit controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card( 
        shadowColor: Color.fromARGB(255, 13, 4, 127),
        // تبديل DecoratedBox بـ Card
        elevation: 2, // إضافة هامش
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // إعطاء البطاقة حواف مستديرة
          side: BorderSide(color: Colors.grey, width: 0.5), // إضافة حدود
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // تحديد النصوص إلى اليسار
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.memory(
                      productModel.image ?? Uint8List(5),
                      height: 80, // زيادة حجم الصورة
                      width: 80, // زيادة حجم الصورة
                      fit: BoxFit.cover, // ضبط تناسب الصورة
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded( // استخدام Expanded لتوسيع النص
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productModel.name ?? 'Product',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          productModel.desc ?? 'Description',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        '\$${(productModel.price ?? 0).toString()}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Text(
                        '${(productModel.availableQuantity ?? 0).toString()} available', // إضافة نص يبين الكمية المتاحة
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Divider(), // تغيير Divider إلى const
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector( // تغيير InkWell إلى GestureDetector
                    onTap: () {
                      if (productModel.favorite == 1) {
                        controller.addItemToFavorite(productModel.id ?? 0, 0);
                      } else {
                        controller.addItemToFavorite(productModel.id ?? 0, 1);
                      }
                    },
                    child: Icon(
                      productModel.favorite == 1
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color: Colors.red,
                      size: 30, // زيادة حجم الأيقونة
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 1, // تعديل عرض الديفايدر
                    color: Colors.grey,
                  ),
                  GestureDetector( // تغيير InkWell إلى GestureDetector
                    onTap: () {
                      if (productModel.cart == 1) {
                        controller.addItemToCart(
                            productModel.id ?? 0, 0, productModel.availableQuantity);
                      } else {
                        controller.addItemToCart(
                            productModel.id ?? 0, 1, productModel.availableQuantity);
                      }
                    },
                    child: Icon(
                      productModel.cart == 1
                          ? CupertinoIcons.cart_fill
                          : CupertinoIcons.cart,
                      color: Colors.blue,
                      size: 30, // زيادة حجم الأيقونة
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

