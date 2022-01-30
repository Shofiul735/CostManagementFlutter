import 'package:flutter/material.dart';

import './widgets/user_transactions.dart';

void main() => runApp(Parent());

class Parent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cost Management APP",
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  // String? title, amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cost Management App!"),
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
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
