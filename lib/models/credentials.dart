import 'dart:convert';

Credentials credentialsFromJson(String str) =>
    Credentials.fromJson(json.decode(str));

String credentialsToJson(Credentials data) => json.encode(data.toJson());

class Credentials {
  Credentials({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory Credentials.fromJson(Map<String, dynamic> json) => Credentials(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
