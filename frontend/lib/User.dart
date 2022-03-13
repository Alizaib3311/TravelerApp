// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String name;
  String email;
  String password;
  // String reg;
  String cnic;
  String phone;
  String type;

  DateTime createdAt;

  UserModel({
    required this.name,
    required this.email,
    required this.cnic,
    required this.password,
    // required this.reg,
    required this.phone,
    required this.type,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        cnic: json["cnic"],
        // reg: json["reg"],
        phone: json["phone"],
        type: json["type"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "cnic": cnic,
        // "reg": reg,
        "phone": phone,
        "type": type,
        "createdAt": createdAt.toIso8601String(),
      };
}
