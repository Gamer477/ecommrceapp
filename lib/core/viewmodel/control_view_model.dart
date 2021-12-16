import 'package:ecommrceapp/view/screens/cart_view.dart';
import 'package:ecommrceapp/view/screens/home_view.dart';
import 'package:ecommrceapp/view/screens/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget _currentScreen = HomeView();
  get navigatorValue => _navigatorValue;
  get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedIndex) {
    _navigatorValue = selectedIndex;
    switch (selectedIndex) {
      case 0:
        _currentScreen = HomeView();
        break;
      case 1:
        _currentScreen = CartView();
        break;
      case 2:
        _currentScreen = ProfileView();
        break;
    }
    update();
  }
}
