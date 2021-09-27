import 'dart:ui';

import 'package:centralized_transaction/models/transaction_list_response_model.dart';
import 'package:flutter/material.dart';

class TransactionCardWidget extends StatelessWidget {
  final TransactionListModel transaction;
  final int index;
  const TransactionCardWidget({
    Key? key,
    required this.transaction,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        left: 5,
        right: 5,
      ),
      child: Card(
        elevation: 1,
        color: Color(0xFFF8E5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TransactionNameValue(name: "From:", value: transaction.from),
              TransactionNameValue(name: "Purpose:", value: transaction.type),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TransactionNameValue(
                      name: "Date:",
                      value:
                          "${transaction.createdAt.year.toString()}-${transaction.createdAt.month.toString()}-${transaction.createdAt.day.toString()}",
                    ),
                  ),
                  Expanded(
                    child: TransactionNameValue(
                      name: "Time:",
                      value:
                          "${transaction.createdAt.hour.toString()}:${transaction.createdAt.minute.toString()}",
                    ),
                  )
                ],
              ),
              Divider(thickness: 2),
              TransactionNameValue(
                  name: "Amount:", value: transaction.amount.toString()),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionNameValue extends StatelessWidget {
  final String name;
  final String value;
  const TransactionNameValue({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
