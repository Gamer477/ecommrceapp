import 'package:ecommrceapp/helper/local_storage_data.dart';
import 'package:ecommrceapp/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  ValueNotifier get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  LocalStrorageData localStrorageData = Get.find();

  UserModel get userModel => _userModel!;

  UserModel? _userModel;

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStrorageData.deleteUser();
  }

  void getCurrentUser() async {
    _loading.value = true;
    await localStrorageData.getUser.then((value) {
      _userModel = value;
    });
    _loading.value = false;
    update();
  }
}
