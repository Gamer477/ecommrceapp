import 'package:ecommrceapp/core/services/database/cart_database_helper.dart';
import 'package:ecommrceapp/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> get cartProductModel => _cartProductModel;
  List<CartProductModel> _cartProductModel = [];
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  var dbHeleper = CartDatabaseHelper.db;
  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;

    _cartProductModel = await dbHeleper.getAllProduct();
    print("sssssssssssssssssssssssssssssssss ${_cartProductModel.length}");
    print("sssssssssssssssssssssssssssssssss ${_cartProductModel[0].image}");
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price!) *
          _cartProductModel[i].quantity!);
      print('Total Price ${_totalPrice}');
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        return;
      }

      await dbHeleper.insert(cartProductModel);
      print('_cartProductModel_cartProductModel${_cartProductModel.length}');
      _cartProductModel.add(cartProductModel);
      _totalPrice +=
          (double.parse(cartProductModel.price!) * cartProductModel.quantity!);
    }
    update();
  }

  increaseQuantitiy(int index) async {
    _cartProductModel[index].quantity = _cartProductModel[index].quantity! + 1;
    _totalPrice += double.parse(_cartProductModel[index].price!);
    await dbHeleper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantitiy(int index) async {
    _cartProductModel[index].quantity = _cartProductModel[index].quantity! - 1;

    _totalPrice -= double.parse(_cartProductModel[index].price!);
    if (_cartProductModel[index].quantity! < 0 && _totalPrice < 0) {
      _cartProductModel[index].quantity = 0;
      _totalPrice = 0;
    }
    await dbHeleper.updateProduct(_cartProductModel[index]);

    update();
  }
}
