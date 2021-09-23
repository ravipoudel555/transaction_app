// To parse this JSON data, do
//
//     final transactionListModel = transactionListModelFromJson(jsonString);

import 'dart:convert';

List<TransactionListModel> transactionListModelFromJson(String str) =>
    List<TransactionListModel>.from(
        json.decode(str).map((x) => TransactionListModel.fromJson(x)));

String transactionListModelToJson(List<TransactionListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionListModel {
  TransactionListModel({
    required this.id,
    required this.citizenship,
    required this.from,
    required this.type,
    required this.author,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String citizenship;
  String from;
  String type;
  Author author;
  int amount;
  DateTime createdAt;
  DateTime updatedAt;

  factory TransactionListModel.fromJson(Map<String, dynamic> json) =>
      TransactionListModel(
        id: json["id"],
        citizenship: json["citizenship"],
        from: json["from"],
        type: json["type"],
        author: Author.fromJson(json["author"]),
        amount: json["amount"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "citizenship": citizenship,
        "from": from,
        "type": type,
        "author": author.toJson(),
        "amount": amount,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Author {
  Author({
    required this.id,
    required this.nickname,
    required this.email,
    required this.citizenship,
    required this.password,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
    this.transaction,
  });

  int id;
  String nickname;
  String email;
  String citizenship;
  String password;
  String token;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic transaction;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        nickname: json["nickname"],
        email: json["email"],
        citizenship: json["citizenship"],
        password: json["password"],
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
        "password": password,
        "token": token,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "transaction": transaction,
      };
}
