import 'package:flutter/material.dart';

import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final Function deleteTransaction;

  TransactionList(this.transactionList, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactionList.isEmpty
        ? Column(
            children: [
              Text(
                'No Transactions added yet!',
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          )
        : ListView(
            children: transactionList.map((tx) {
              return TransactionItem(
                key: ValueKey(tx.id),
                transaction: tx,
                deleteTransaction: deleteTransaction,
              );
            }).toList(),
          );
  }
}
