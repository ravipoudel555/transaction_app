import 'package:centralized_transaction/controllers/transaction/transaction_controller.dart';
import 'package:centralized_transaction/presentation/dashboard/widgets/transaction_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionOverviewBody extends StatelessWidget {
  const TransactionOverviewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.find<TransactionController>();

    return StreamBuilder(
        stream: c.getTransactionListStream(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data.length == 0) {
              return Container(
                child: Text('No transactions'),
              );
            } else {
              return Column(
                children: [
                  c.transactionType == TransactionType.MONTH
                      ? Expanded(
                          child: Card(
                          margin: EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                          ),
                          elevation: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Monthly Expenditure:',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ' ${c.total}',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ))
                      : Container(),
                  Expanded(
                    flex: 12,
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return TransactionCardWidget(
                            transaction: snapshot.data[index],
                            index: index,
                          );
                        }),
                  ),
                ],
              );
            }
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
