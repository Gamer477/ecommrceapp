import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? userId, name, email, pic;
  UserModel({
    required this.pic,
    required this.name,
    required this.email,
    required this.userId,
  });

  UserModel.fromJSON(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    name = map['name'];
    email = map['email'];
    pic = map['pic'];
  }
  toJSON() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'pic': pic,
    };
  }
}
