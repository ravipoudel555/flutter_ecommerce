// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.msg,
    required this.token,
    required this.email,
  });

  String msg;
  String token;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        msg: json["msg"],
        token: json["token"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "token": token,
        "email": email,
      };
}
