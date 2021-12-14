import 'package:ecommrceapp/core/viewmodel/auth_view_model.dart';
import 'package:ecommrceapp/view/screens/home_view.dart';
import 'package:ecommrceapp/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? HomeView()
          : LoginView();
    });
  }
}
