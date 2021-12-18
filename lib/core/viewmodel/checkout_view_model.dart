import 'package:ecommrceapp/constants.dart';
import 'package:ecommrceapp/helper/enum.dart';
import 'package:ecommrceapp/view/screens/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutViewModel extends GetxController {
  int _index = 0;
  int get index => _index;

  Pages get pages => _pages;
  Pages _pages = Pages.DeliveryTime;

  void changeIndex(int i) {
    _index = i;
    if (_pages == 1) {
      _pages = Pages.AddAddress;
    } else if (_pages == 2) {
      _pages = Pages.Summary;
    } else if (_pages == 3) {
      Get.to(ControlView());
    }
    update();
  }

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }
}
