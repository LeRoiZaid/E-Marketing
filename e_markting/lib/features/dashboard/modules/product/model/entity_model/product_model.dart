import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class ProductModel {
  String? name, desc;
  double? price;
  int? favorite, cart, id, availableQuantity, quantity;
  Uint8List? image;

  ProductModel.fromJson(Map m) {
    log(m.toString());
    name = m['name'];
    desc = m['description'];
    image = m['image'];
    quantity = m['quantity'];
    price = m['price'];
    availableQuantity = m['availableQuantity'];
    cart = m['cart'];
    favorite = m['favorite'];
    id = m['id'];
  }
}
