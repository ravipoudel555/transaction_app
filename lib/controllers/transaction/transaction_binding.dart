import 'package:centralized_transaction/controllers/transaction/transaction_controller.dart';
import 'package:get/get.dart';

class TransactionBinding extends Bindings {
  void dependencies() {
    Get.put(TransactionController());
  }
}
