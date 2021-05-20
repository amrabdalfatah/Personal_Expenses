import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/chart.dart';
import './widgets/transaction_card.dart';

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: '1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: '2', title: 'New Shirt', amount: 49.99, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Chart(),
            ...transactions.map((index) {
              return TransactionCard(
                title: index.title,
                date: index.date,
                amount: index.amount,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
