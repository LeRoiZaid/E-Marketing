import 'dart:typed_data';

import 'package:e_markting/features/dashboard/modules/favorite/controller/favorite_cubit.dart';
import 'package:e_markting/features/dashboard/modules/product/model/entity_model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteItemWidget extends StatelessWidget {
  const FavoriteItemWidget({
    super.key,
    required this.productModel,
    required this.controller,
  });
  final ProductModel productModel;
  final FavoriteCubit controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Color.fromARGB(255, 176, 222, 240),
        shadowColor: Color.fromARGB(255, 13, 4, 127),
        // تبديل DecoratedBox بـ Card
        elevation: 2, // إضافة هامش
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // إعطاء البطاقة حواف مستديرة
          side: BorderSide(
              color: Color.fromARGB(255, 29, 115, 191),
              width: 0.5), // إضافة حدود
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // تحديد النصوص إلى اليسار
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.memory(
                      productModel.image ?? Uint8List(5),
                      height: 100, // زيادة حجم الصورة
                      width: 100, // زيادة حجم الصورة
                      fit: BoxFit.cover, // ضبط تناسب الصورة
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    // استخدام Expanded لتوسيع النص
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productModel.name ?? 'Product',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          productModel.desc ?? 'Description',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        '${(productModel.availableQuantity ?? 0).toString()} available', // إضافة نص يبين الكمية المتاحة
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  )
                ],
              ),
              const Divider(endIndent:25,color: Colors.blue,indent:25,thickness:1.5,height: 45,), // تغيير Divider إلى const
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    // تغيير InkWell إلى GestureDetector
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
                
                
                
                  
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
