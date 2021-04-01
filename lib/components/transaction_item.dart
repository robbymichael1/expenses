import 'dart:math';

import 'package:expenses/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final Transaction transaction;
  final void Function(String) onDelete;

  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.onDelete,
  }) : super(key: key);

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const colors = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.black
  ];

  Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    int i = Random().nextInt(5);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                'R\$${widget.transaction.value.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat('d MMM y').format(widget.transaction.date)),
        trailing: MediaQuery.of(context).size.width > 500
            ? Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => widget.onDelete(widget.transaction.id),
                    child: Text(
                      'Excluir',
                      style: TextStyle(color: Theme.of(context).errorColor),
                    ),
                  ),
                  Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  )
                ],
              )
            : IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => widget.onDelete(widget.transaction.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
