import 'dart:convert';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:centralized_transaction/models/sign_up_model.dart';
import 'package:centralized_transaction/services/constraints.dart';
import 'package:centralized_transaction/services/repositories/remote_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final TextEditingController nickName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController citizenship = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool validateEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email.text);
  }

  bool validatePassword() {
    return password.text.length > 8;
  }

  void signUp(context) async {
    // var body = credentialsToJson(
    //     Credentials(email: email.text, password: password.text));
    var body = signUpModelToJson(
      SignUpModel(
        nickname: nickName.text,
        email: email.text,
        citizenship: citizenship.text,
        password: password.text,
      ),
    );

    final url = BASE_URL + '/users';

    var response = await RemoteRepository().postApi(url, body);

    if (response.statusCode == 201) {
      final responseDecoded = signUpModelFromJson(response.body);
      Get.toNamed("/signin");
    } else {
      final decoded = jsonDecode(response.body);
      String errorMessage = decoded["error"];

      FlushbarHelper.createError(
        message: errorMessage,
        duration: Duration(seconds: 2),
      ).show(context);
    }
  }
}
