import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  Function inputHandler;
  NewTransaction(this.inputHandler);
  @override
  State<StatefulWidget> createState() {
    return NewTransactionState();
  }
}

class NewTransactionState extends State<NewTransaction> {
  final title = TextEditingController();
  final amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: TextField(
                // onChanged: (value) => title = value,
                controller: title,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Title',
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
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: TextField(
                // onChanged: (value) => amount = value,
                controller: amount,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
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
              onPressed: () {
                // print(title);
                // print(amount);
                widget.inputHandler(title.text, double.parse(amount.text));
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
              style: TextButton.styleFrom(
                primary: Colors.blue,
                backgroundColor: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
