import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            TextButton(
              child: Text('Add Transaction'),
              onPressed: () {
                final enteredTitle = titleController.text;
                final enteredAmount = double.parse(amountController.text);

                if (enteredTitle.isEmpty || enteredAmount <= 0) {
                  // to stop method work if one of this expression is true
                  return;
                }

                addNewTransaction(
                  enteredTitle,
                  enteredAmount,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
