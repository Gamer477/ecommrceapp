import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommrceapp/core/services/home_services.dart';
import 'package:ecommrceapp/model/category_model.dart';
import 'package:ecommrceapp/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class HomeViewModel extends GetxController {
  ValueNotifier get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;

  List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;

  List<ProductModel> _productModel = [];

  HomeViewModel() {
    getCategory();
    getBestSellingProduct();
  }

  getCategory() async {
    _loading.value = true;

    HomeServices().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromJSON(value[i].data() as Map<dynamic, dynamic>));
        print(categoryModel.length);
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProduct() async {
    _loading.value = true;
    HomeServices().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(
            ProductModel.fromJSON(value[i].data() as Map<dynamic, dynamic>));
        print("productModelLength: ${productModel.length}");
        _loading.value = false;
      }
      update();
    });
  }
}
