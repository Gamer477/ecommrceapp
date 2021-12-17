import 'dart:ui';

import 'package:ecommrceapp/helper/extention.dart';

class ProductModel {
  String? productId, name, image, description, size, price;
  Color? color;
  ProductModel({
    required this.name,
    required this.image,
    required this.description,
    required this.color,
    required this.size,
    required this.price,
    required this.productId,
  });
  ProductModel.fromJSON(Map<dynamic, dynamic> map) {
    // ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    size = map['size'];
    price = map['price'];
    productId = map['productId'];
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'size': size,
      'price': price,
      'productId': productId,
    };
  }
}
