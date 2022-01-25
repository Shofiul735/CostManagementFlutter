import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              child: Text(
                "Chart".toUpperCase(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: 'Title',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Amount',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Submit'),
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                      backgroundColor: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: transaction.map((item) {
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
                      '\$${item.amount}',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
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
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().format(item.date),
                          style: const TextStyle(
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
