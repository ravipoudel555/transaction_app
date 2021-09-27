import 'dart:convert';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:centralized_transaction/local_repo/service_preferences.dart';
import 'package:centralized_transaction/models/credentials.dart';
import 'package:centralized_transaction/models/login_response_model.dart';
import 'package:centralized_transaction/services/constraints.dart';
import 'package:centralized_transaction/services/repositories/remote_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

enum SignInState {
  NoError,
  InvalidEmailAndPassword,
}

class SignInController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool validateEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email.text);
  }

  bool validatePassword() {
    return password.text.length > 8;
  }

  void signIn(BuildContext context) async {
    var body = credentialsToJson(
      Credentials(email: email.text, password: password.text),
    );

    final url = BASE_URL + '/login';

    var response = await RemoteRepository().postApi(url, body);

    if (response.statusCode == 200) {
      final responseModel = loginResponseModelFromJson(response.body);
      String token = responseModel.token;
      String citizenship = responseModel.citizenship;

      await ServicePref().setToken(token);
      await ServicePref().setCitizenship(citizenship);
      await ServicePref().setStatus(true);
      password.text = "";
      Get.toNamed("/dashboard");
    } else {
      final decoded = jsonDecode(response.body);
      String errorMessage = decoded["error"];
      if (errorMessage ==
              'crypto/bcrypt: hashedPassword is not the hash of the given password' ||
          errorMessage == "record not found") {
        FlushbarHelper.createError(
          message: 'Invalid email and password combination',
          duration: Duration(seconds: 2),
        ).show(context);
      }
    }
  }
}
