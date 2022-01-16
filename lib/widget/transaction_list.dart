import 'package:flutter/material.dart';
import 'package:personal_expenses/widget/imagetransaction.dart';
import '../models/transaction.dart';
import 'transactionItem.dart';

class TransactionList extends StatelessWidget {
  final List<TransAction> transaction;
  final Function deleteTS;
  TransactionList(this.transaction, this.deleteTS);
  @override
  Widget build(BuildContext context) {
    return (transaction.isEmpty)
        ? ImageForNotTransaction('Not Transction Added Yet!')
        : ListView(
            children: [
              ...transaction
                  .map((ts) => TransactionItem(
                        key: ValueKey(ts.id),
                        transaction: ts,
                        deleteTS: deleteTS,
                      ))
                  .toList()
            ],
          );
  }
}
