import 'dart:typed_data';

import 'package:e_markting/features/dashboard/modules/cart/controller/cart_cubit.dart';
import 'package:e_markting/features/dashboard/modules/product/model/entity_model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    Key? key,
    required this.productModel,
    required this.controller,
  }) : super(key: key);

  final ProductModel productModel;
  final CartCubit controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Color.fromARGB(255, 176, 222, 240),
        shadowColor: Color.fromARGB(255, 13, 4, 127),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Color.fromARGB(255, 29, 115, 191),
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.memory(
                      productModel.image ?? Uint8List(5),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
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
                        '${(productModel.availableQuantity ?? 0).toString()} available',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Divider(
                endIndent: 25,
                color: Colors.blue,
                indent: 25,
                thickness: 1.5,
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '\$ ${productModel.price}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 3,
                    color: Colors.blue,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (productModel.cart == 1) {
                        controller.addItemToCart(
                          productModel.id ?? 0,
                          0,
                          productModel.availableQuantity,
                        );
                      } else {
                        controller.addItemToCart(
                          productModel.id ?? 0,
                          1,
                          productModel.availableQuantity,
                        );
                      }
                    },
                    child: Icon(
                      productModel.cart == 1
                          ? CupertinoIcons.cart_fill
                          : CupertinoIcons.cart,
                      color: Colors.blue,
                      size: 30,
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
