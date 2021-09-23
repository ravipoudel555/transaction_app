// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    required this.id,
    required this.nickname,
    required this.email,
    required this.citizenship,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
    required this.transaction,
  });

  int id;
  String nickname;
  String email;
  String citizenship;
  String token;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic transaction;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        id: json["id"],
        nickname: json["nickname"],
        email: json["email"],
        citizenship: json["citizenship"],
        token: json["token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        transaction: json["transaction"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nickname": nickname,
        "email": email,
        "citizenship": citizenship,
        "token": token,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "transaction": transaction,
      };
}
