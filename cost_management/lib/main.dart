import 'package:flutter/material.dart';

import './widgets/transaction_card.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() => runApp(Parent());

class Parent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyHomePage> {
  // String? title, amount;

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

  void showAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cost Management App!"),
        actions: [
          IconButton(
            onPressed: () => showAddTransaction(context),
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                color: Colors.amberAccent,
                alignment: Alignment.center,
                child: Text(
                  "Chart".toUpperCase(),
                ),
              ),
            ),
            TransactionCard(transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showAddTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
