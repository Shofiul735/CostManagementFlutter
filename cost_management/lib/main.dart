import 'package:flutter/material.dart';

import './transaction.dart';

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
  List<Transaction> transaction = [
    Transaction(
        id: "t1", title: "New Shoes", amount: 99.00, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Books", amount: 9.99, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cost Management App!"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              color: Colors.amberAccent,
              child: const Text(
                "Card-2",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Card(
            child: Text(
              "Card-2",
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            children: transaction.map((item) {
              return Card(
                  child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple,
                          width: 2.0,
                          style: BorderStyle.solid),
                    ),
                    child: Text(
                      item.amount.toString(),
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          item.date.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ])
                ],
              ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
