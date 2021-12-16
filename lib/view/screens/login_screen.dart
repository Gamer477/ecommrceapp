import 'package:ecommrceapp/constants.dart';
import 'package:ecommrceapp/core/viewmodel/auth_view_model.dart';
import 'package:ecommrceapp/view/screens/register_screen.dart';
import 'package:ecommrceapp/view/widgets/custom_button.dart';
import 'package:ecommrceapp/view/widgets/custom_button_social.dart';
import 'package:ecommrceapp/view/widgets/custom_text.dart';
import 'package:ecommrceapp/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetWidget<AuthViewModel> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    CustomText(
                      text: "Welcome,",
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    InkWell(
                      onTap: () => Get.to(RegisterView()),
                      child: CustomText(
                        text: "Sign Up",
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: 'Sign in to Continue',
                  color: Colors.grey.shade500,
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
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  alignment: Alignment.topRight,
                  text: 'Forgot Password?',
                  fontSize: 14,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  buttonText: 'SIGN IN',
                  onPressed: () {
                    _formkey.currentState!.save();
                    if (_formkey.currentState!.validate()) {
                      controller.signInWithEmailAndPassword();
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomText(
                  text: '-OR-',
                  alignment: Alignment.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButtonSocial(
                  onPressed: () {
                    controller.faceBookSignInMethod();
                  },
                  imageName: 'assets/images/facebook.png',
                  buttonText: 'Sign In With Facebook',
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButtonSocial(
                  onPressed: () {
                    controller.googleSignInMethod();
                  },
                  imageName: 'assets/images/google.png',
                  buttonText: 'Sign In With Google',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
