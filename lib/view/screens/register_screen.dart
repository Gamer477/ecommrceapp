import 'package:ecommrceapp/core/viewmodel/auth_view_model.dart';
import 'package:ecommrceapp/view/screens/login_screen.dart';
import 'package:ecommrceapp/view/widgets/custom_button.dart';
import 'package:ecommrceapp/view/widgets/custom_button_social.dart';
import 'package:ecommrceapp/view/widgets/custom_text.dart';
import 'package:ecommrceapp/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Get.off(LoginView()),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50.0,
            right: 20,
            left: 20,
          ),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                CustomText(
                  text: "Sign Up,",
                  fontSize: 18,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  onSave: (val) {
                    controller.name = val;
                  },
                  validator: (val) {
                    if (val == null) {
                      print('ERROR');
                    }
                  },
                  text: 'Name',
                  hintText: 'David Spade',
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  onSave: (val) {
                    controller.email = val;
                  },
                  validator: (val) {
                    if (val == null) {
                      print('ERROR');
                    }
                  },
                  text: 'Email',
                  hintText: 'iamdavid@gmail.com',
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  onSave: (val) {
                    controller.password = val;
                  },
                  validator: (val) {
                    if (val == null) {
                      print('ERROR');
                    }
                  },
                  text: 'Password',
                  hintText: '***********',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  buttonText: 'SIGN UP',
                  onPressed: () {
                    _formkey.currentState!.save();
                    if (_formkey.currentState!.validate()) {
                      controller.createAccountWithEmailAndPassword();
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
