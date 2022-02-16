import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './widgets/transaction_card.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(Parent());
}

class Parent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Quicksand',
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6: const TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              button: const TextStyle(
                color: Colors.white,
              ),
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
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

  // List<Transaction> transactions = [
  //   Transaction(
  //       id: "t1", title: "New Shoes", amount: 99.00, date: DateTime.now()),
  //   Transaction(
  //       id: "t2", title: "New Books", amount: 9.99, date: DateTime.now())
  // ];
  var _showList = false;
  List<Transaction> transactions = [];
  void addTransaction(String titleText, double amountTxt, DateTime userDate) {
    var tx = Transaction(
      id: DateTime.now().toString(),
      title: titleText,
      amount: amountTxt,
      date: userDate,
    );
    setState(() {
      transactions.add(tx);
    });
  }

  void deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((element) => element.id == id);
    });
  }

  void changeSwitchValue(value) => setState(() {
        _showList = value;
      });

  List<Transaction> get _recentTransactions {
    return transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void showAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return NewTransaction(addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text("Cost Management App!"),
      actions: [
        IconButton(
          onPressed: () => showAddTransaction(context),
          icon: const Icon(
            Icons.add,
          ),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Show List',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Switch(
                  value: _showList,
                  onChanged: (value) {
                    changeSwitchValue(value);
                  },
                ),
              ],
            ),
            !_showList
                ? Card(
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      color: Colors.amberAccent,
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top -
                                MediaQuery.of(context).padding.bottom -
                                kToolbarHeight -
                                appBar.preferredSize.height) *
                            0.7,
                        child: Chart(_recentTransactions),
                      ),
                    ),
                  )
                : SizedBox(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top -
                            MediaQuery.of(context).padding.bottom -
                            kToolbarHeight -
                            appBar.preferredSize.height) *
                        0.7,
                    child: TransactionCard(transactions, deleteTransaction),
                  ),
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
