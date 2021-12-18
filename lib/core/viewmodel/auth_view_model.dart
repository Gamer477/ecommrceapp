import 'package:ecommrceapp/core/services/firestore_user.dart';
import 'package:ecommrceapp/helper/local_storage_data.dart';
import 'package:ecommrceapp/model/user_model.dart';
import 'package:ecommrceapp/view/screens/control_view.dart';
import 'package:ecommrceapp/view/screens/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  String? email, password, name;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );
  FirebaseAuth _auth = FirebaseAuth.instance;

  FacebookLogin _facebookLogin = FacebookLogin();

  Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

  LocalStrorageData localStrorageData = Get.find();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrentUserData(_auth.currentUser!.uid);
    }
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    await _auth.signInWithCredential(credential).then((user) async {
      saveUserData(user);
      Get.offAll(ControlView());
    });
  }

  void faceBookSignInMethod() async {
    FacebookLoginResult result = await _facebookLogin.logIn(
      customPermissions: ['email'],
    );
    final accessToken = result.accessToken?.token;
    print("accceessss Token ${accessToken}");
    if (result.status == FacebookLoginStatus.success) {
      final faceCredential = FacebookAuthProvider.credential(accessToken!);
      print("Facccccccccccccccccce ${faceCredential}");
      await _auth.signInWithCredential(faceCredential).then((user) async {
        saveUserData(user);
      });
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        getCurrentUserData(user.user!.uid);
      });
      Get.offAll(ControlView());
    } catch (e) {
      Get.snackbar(
        'Error Login Account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        saveUserData(user);
        Get.offAll(ControlView());
      });
    } catch (e) {
      Get.snackbar(
        'Error Sign Up Account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUserData(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      name: name == null ? user.user!.displayName : name,
      email: user.user!.email,
      pic: '',
    );
    await FireStroeUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void getCurrentUserData(String uid) async {
    await FireStroeUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJSON(value.data() as Map<dynamic, dynamic>));
    });
  }

  void setUser(UserModel userModel) async {
    await localStrorageData.setUser(userModel);
  }
}
