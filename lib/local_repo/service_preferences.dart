import 'package:shared_preferences/shared_preferences.dart';

class ServicePref {
  static SharedPreferences? _preferences;
  // setToken(String token) async {
  //   final pass = await SharedPreferences.getInstance();
  //   pass.setString('token', token);
  // }

  // Future<String> getToken() async {
  //   final pass = await SharedPreferences.getInstance();
  //   String token = pass.getString('token')!;
  //   return token;
  // }
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  Future<bool> setStatus(bool login) async {
    return _preferences!.setBool('login', login);
  }

  bool getStatus() {
    return _preferences?.getBool('login') ?? false;
  }

  Future<bool> setToken(String token) async {
    return _preferences!.setString('token', token);
  }

  String getToken() {
    return _preferences?.getString('token') ?? '';
  }

  Future<bool> setCitizenship(String citizenship) async {
    return _preferences!.setString('citizenship', citizenship);
  }

  String getCitizenship() {
    return _preferences?.getString('citizenship') ?? '';
  }
}
