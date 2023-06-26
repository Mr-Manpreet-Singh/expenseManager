import 'package:flutter/material.dart';
import 'package:expense_tracker/models/Transaction.dart';
import 'package:intl/intl.dart';

class PrintTransaction extends StatelessWidget {
  // const PrintTransaction({super.key});
  final List<Transaction> transaction;
  final Function removeItem;
  PrintTransaction(this.transaction, this.removeItem);

  @override
  Widget build(BuildContext context) {
    // print("Inside Print Transaction");
    return Container(
      // height: 400,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 6,
            child: (ListTile(
              leading: CircleAvatar(
                radius: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: FittedBox(
                    child: Text(
                      transaction[index].amount.toStringAsFixed(1),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              title: Text(
                transaction[index].title,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(transaction[index].date),
                style: Theme.of(context).textTheme.displaySmall,
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                // onPressed: () {},
                onPressed: () {
                  removeItem(transaction[index].id);
                },
                color: Theme.of(context).colorScheme.error,
              ),
            )),
          );
        },
        itemCount: transaction.length,
      ),
    );
  }
}

