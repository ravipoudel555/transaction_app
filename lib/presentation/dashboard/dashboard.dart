import 'package:centralized_transaction/controllers/sign_in/sign_in_controller.dart';
import 'package:centralized_transaction/controllers/transaction/transaction_controller.dart';
import 'package:centralized_transaction/local_repo/service_preferences.dart';
import 'package:centralized_transaction/presentation/dashboard/widgets/transaction_overview_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String dropdownValue = 'All';
  @override
  Widget build(BuildContext context) {
    final c = Get.find<TransactionController>();
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Transactions'),
            leading: IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async {
                await ServicePref().setStatus(false);

                Get.back();

                Get.toNamed("/");
              },
            ),
            actions: [
              Align(
                alignment: Alignment.center,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  onChanged: (String? newValue) {
                    if (newValue == 'PSP') {
                      c.transactionType = TransactionType.PSP;
                    } else if (newValue == 'BANK') {
                      c.transactionType = TransactionType.BANK;
                    } else {
                      c.transactionType = TransactionType.ALL;
                    }
                    setState(() {
                      dropdownValue = newValue ?? 'ALL';
                    });
                  },
                  underline: Container(
                    height: 1,
                    color: Colors.white,
                  ),
                  items: <String>['All', 'PSP', 'BANK']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  c.desc = !c.desc;
                },
                icon: Icon(Icons.sort),
              ),
            ],
          ),
          body: TransactionOverviewBody(),
        ),
      ),
    );
  }
}
