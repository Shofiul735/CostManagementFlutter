import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_card.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserTransactionsState();
  }
}

class UserTransactionsState extends State<UserTransactions> {
  List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "New Shoes", amount: 99.00, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Books", amount: 9.99, date: DateTime.now())
  ];

  void addTransaction(String titleText, double amountTxt) {
    var tx = Transaction(
        id: DateTime.now().toString(),
        title: titleText,
        amount: amountTxt,
        date: DateTime.now());
    setState(() {
      transactions.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransation(addTransaction),
        TransactionCard(transactions),
      ],
    );
  }
}
