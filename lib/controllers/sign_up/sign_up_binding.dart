import 'package:centralized_transaction/controllers/sign_up/sign_up_controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  void dependencies() {
    Get.put(SignUpController());
  }
}
