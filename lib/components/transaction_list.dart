import 'package:expenses/components/transaction_item.dart';
import 'package:expenses/model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onDelete;

  TransactionList(this.transactions, this.onDelete);

  @override
  Widget build(BuildContext context) {
    return this.transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                Text(
                  'Nada a mostrar',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final transaction = transactions[index];
              return TransactionItem(
                transaction: transaction,
                onDelete: onDelete,
                key: GlobalObjectKey(transaction.id),
              );
            },
          );

    // ListView(
    //   children: transactions.map((tr) {
    //     return TransactionItem(
    //       key: ValueKey(tr.id),
    //       transaction: tr,
    //       onDelete: onDelete,
    //     );
    //   }).toList(),
    // );
  }
}
