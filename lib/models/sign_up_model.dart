// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    this.id,
    this.nickname,
    this.email,
    this.citizenship,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.transaction,
  });

  int? id;
  String? nickname;
  String? email;
  String? citizenship;
  String? password;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic transaction;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "transaction": transaction,
      };
}
