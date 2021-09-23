import 'package:centralized_transaction/controllers/transaction/transaction_controller.dart';
import 'package:centralized_transaction/local_repo/service_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.find<TransactionController>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Transactions'),
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await ServicePref().setStatus(false);
            },
          ),
        ),
        body: Column(children: <Widget>[
          TextButton(
            onPressed: () {
              c.getTransactionList();
            },
            child: Text('Get Data'),
          ),
        ]),
      ),
    );
  }
}
