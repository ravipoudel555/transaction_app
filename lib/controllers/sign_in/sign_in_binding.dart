import 'package:centralized_transaction/controllers/sign_in/sign_in_controller.dart';
import 'package:get/get.dart';

class SignInBinding extends Bindings {
  void dependencies() {
    Get.put(SignInController());
  }
}
