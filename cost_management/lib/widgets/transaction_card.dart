import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionCard(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
              child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.purple,
                      width: 2.0,
                      style: BorderStyle.solid),
                ),
                child: Text(
                  '\$${transactions[index].amount.toStringAsFixed(2)}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  transactions[index].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  DateFormat.yMMMd().format(transactions[index].date),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ])
            ],
          ));
        },
      ),
    );
  }
}
