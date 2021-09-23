// To parse this JSON data, do
//
//     final signUpResponseModel = signUpResponseModelFromJson(jsonString);

import 'dart:convert';

SignUpResponseModel signUpResponseModelFromJson(String str) =>
    SignUpResponseModel.fromJson(json.decode(str));

String signUpResponseModelToJson(SignUpResponseModel data) =>
    json.encode(data.toJson());

class SignUpResponseModel {
  SignUpResponseModel({
    required this.id,
    required this.nickname,
    required this.email,
    required this.citizenship,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.transaction,
  });

  int id;
  String nickname;
  String email;
  String citizenship;
  String password;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic transaction;

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        id: json["id"],
        nickname: json["nickname"],
        email: json["email"],
        citizenship: json["citizenship"],
        password: json["password"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        transaction: json["transaction"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nickname": nickname,
        "email": email,
        "citizenship": citizenship,
        "password": password,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "transaction": transaction,
      };
}
