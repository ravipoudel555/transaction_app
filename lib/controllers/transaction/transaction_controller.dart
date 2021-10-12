import 'dart:convert';

import 'package:centralized_transaction/local_repo/service_preferences.dart';
import 'package:centralized_transaction/models/transaction_list_response_model.dart';
import 'package:centralized_transaction/services/constraints.dart';
import 'package:centralized_transaction/services/repositories/remote_repository.dart';
import 'package:get/get.dart';

enum TransactionType {
  ALL,
  PSP,
  BANK,
  MONTH,
}

class TransactionController extends GetxController {
  List<TransactionListModel> transactionListModel =
      <TransactionListModel>[].obs();
  var transactionType = TransactionType.ALL.obs();
  var desc = true.obs();
  var total = 0.obs();
  Future<List<TransactionListModel>> getTransactionList() async {
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

    if (transactionType == TransactionType.MONTH) {
      transactionListModel = transactionListModel.where((transaction) {
        return transaction.createdAt.month == DateTime.now().month;
      }).toList();
    } else if (transactionType == TransactionType.PSP) {
      transactionListModel = transactionListModel
          .where(
              (transaction) => transaction.from == 'Payment Service Provider')
          .toList();
    } else if (transactionType == TransactionType.BANK) {
      transactionListModel = transactionListModel
          .where((transaction) => transaction.from == 'Bank')
          .toList();
    } else {
      transactionListModel = transactionListModelFromJson(response.body);
    }

    if (desc) {
      transactionListModel.sort((b, a) => a.createdAt.compareTo(b.createdAt));
    } else {
      transactionListModel.sort((b, a) => b.createdAt.compareTo(a.createdAt));
    }

    total = 0;
    for (final transaction in transactionListModel) {
      total = total + transaction.amount;
    }
    return transactionListModel;
  }

  getTransactionListStream() async* {
    while (true) {
      yield await Future.delayed(Duration(seconds: 3), () {
        return getTransactionList();
      });
    }
  }
}
