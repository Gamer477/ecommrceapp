import 'dart:ui';

import 'package:ecommrceapp/helper/extention.dart';

class CartProductModel {
  String? name, image, price, productId;
  int? quantity;
  CartProductModel({
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.productId,
  });
  CartProductModel.fromJSON(Map<dynamic, dynamic> map) {
    // ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price = map['price'];
    productId = map['productId'];
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'productId': productId,
    };
  }
}
