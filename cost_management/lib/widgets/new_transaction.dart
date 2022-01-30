import 'package:flutter/material.dart';

class NewTransation extends StatelessWidget {
  final title = TextEditingController();
  final amount = TextEditingController();
  Function inputHandler;
  NewTransation(this.inputHandler);
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
                inputHandler(title.text, double.parse(amount.text));
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
