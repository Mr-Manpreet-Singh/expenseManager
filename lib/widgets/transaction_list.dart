// import 'package:flutter/material.dart';
// import '../models/Transaction.dart';
// import 'package:expense_tracker/widgets/new_input.dart';
// import 'package:expense_tracker/widgets/print_transaction.dart';

// class TransactionList extends StatefulWidget {
//   // const TransactionList({super.key});

//   @override
//   State<TransactionList> createState() => _TransactionListState();
// }

// class _TransactionListState extends State<TransactionList> {
//   // const TransactionList({super.key});

//   final List<Transaction> _transaction = [
//     Transaction(
//       id: 'a',
//       title: 'xyz',
//       amount: 100.99,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: 'b',
//       title: 'xyz',
//       amount: 101.99,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: 'c',
//       title: 'xyz',
//       amount: 102.99,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: 'd',
//       title: 'Singh',
//       amount: 1000000.99,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: 'e',
//       title: 'King',
//       amount: 101.9954864,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: 'f',
//       title: 'Manu',
//       amount: 164545.954549,
//       date: DateTime.now(),
//     ),
//   ];
//   void _addItem(String txtitle, double txamount) {
//     final newtx = Transaction(
//       amount: txamount,
//       title: txtitle,
//       date: DateTime.now(),
//       id: DateTime.now().toString(),
//     );
    
//     setState(() {
//       _transaction.add(newtx);
//     });
//     // print("${newtx.amount}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Column(
//       children: [
//         NewInput(_addItem),
//         PrintTransaction(_transaction),
//       ],
//     );
//   }
// }
