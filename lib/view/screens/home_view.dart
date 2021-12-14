import 'package:ecommrceapp/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: InkWell(
            onTap: () {
              Get.off(LoginView());
            },
            child: Icon(
              Icons.logout,
            )),
      ),
    );
  }
}
