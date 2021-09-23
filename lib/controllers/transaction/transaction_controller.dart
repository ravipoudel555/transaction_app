import 'dart:convert';

import 'package:centralized_transaction/local_repo/service_preferences.dart';
import 'package:centralized_transaction/models/transaction_list_response_model.dart';
import 'package:centralized_transaction/services/constraints.dart';
import 'package:centralized_transaction/services/repositories/remote_repository.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  List transactionListModel = [].obs();
  void getTransactionList() async {
    final url = BASE_URL + "/transaction/list";

    final body = {"citizenship": ServicePref().getCitizenship()};
    final header = {
      "Authorization": "bearer ${ServicePref().getToken()}",
    };

    var response = await RemoteRepository().transactionApi(
      url,
      jsonEncode(body),
      header,
    );

    transactionListModel = transactionListModelFromJson(response.body);
  }
}
