import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTS,
  }) : super(key: key);

  final TransAction transaction;
  final Function deleteTS;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _backgrColor;
  @override
  void initState() {
    const _chooseColor = [Colors.red, Colors.blue, Colors.black, Colors.purple];
    super.initState();
    _backgrColor = _chooseColor[Random().nextInt(_chooseColor.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 9, horizontal: 6),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgrColor,
          radius: 25,
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Text('\$${widget.transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          '${widget.transaction.title}',
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 500
            ? FlatButton.icon(
                onPressed: () => widget.deleteTS(widget.transaction.id),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                textColor: Theme.of(context).errorColor,
                label: const Text('Delete'),
              )
            : IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () => widget.deleteTS(widget.transaction.id),
              ),
      ),
    );
  }
}
