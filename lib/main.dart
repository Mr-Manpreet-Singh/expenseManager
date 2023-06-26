// import 'dart:js_util';
import 'package:flutter/material.dart';
// class Model
import '../models/Transaction.dart';
import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/new_input.dart';
import 'package:expense_tracker/widgets/print_transaction.dart';


void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitDown]);
  runApp(ExpenseTracker());
}

class ExpenseTracker extends StatelessWidget {
  //const ExpenseTracker();
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: MyHome(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        // textTheme: ThemeData.light().textTheme.copyWith(titleLarge: TextStyle(
        //            backgroundColor: Colors.white60,
        //           // color: Colors.white,
        //           ),
        //     ),
        textTheme: const TextTheme(
            displayMedium: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
            displaySmall: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
      ),
    ));
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  // const MyHome({super.key});
  final List<Transaction> _transaction = [];
  List<Transaction> get _recentTransaction {
    return _transaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _addItem(String txtitle, double txamount, DateTime txDate) {
    final newtx = Transaction(
      amount: txamount,
      title: txtitle,
      date: txDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _transaction.add(newtx);
    });
    // print("${newtx.amount}");
    Navigator.of(context).pop();
  }

  void _removeItem(String itemId) {
    setState(() {
      _transaction.removeWhere((tx) => tx.id == itemId);
    });
  }

  void _startNewInput(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bctx) {
        return NewInput(_addItem);
      },
    );
  }

  bool _showChart = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final appBarVariable = AppBar(
      actions: [
        IconButton(
          onPressed: () => _startNewInput(context),
          icon: const Icon(
            Icons.add_circle_outlined,
            size: 41,
          ),
        ),
      ],
      title: const Text('Expence_Manager'),
    );

    return Scaffold(
      appBar: appBarVariable,
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        if (!isLandscape)
          Container(
              height: (mediaQuery.size.height -
                      appBarVariable.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.28,
              child: Chart(_recentTransaction)),
        if (!isLandscape)
          SizedBox(
              height: mediaQuery.size.height * 0.6355,
              // height: (mediaQuery.size.height -
              //         mediaQuery.padding.bottom) *0.72,
              child: PrintTransaction(_transaction, _removeItem)),
        // 0.28 0.6355
        if (isLandscape)
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Show Chart'),
            Switch(
              value: _showChart,
              onChanged: (bool newVal) {
                setState(() {
                  _showChart = newVal;
                });
              },
            ),
          ]),
        if (isLandscape)
          (_showChart)
              ? Container(
                  height: (mediaQuery.size.height -
                          appBarVariable.preferredSize.height -
                          mediaQuery.padding.top) *
                      0.7,
                  child: Chart(_recentTransaction))
              : Container(
                  height: mediaQuery.size.height * 0.6355,
                  // height: (mediaQuery.size.height -
                  //         mediaQuery.padding.bottom) *0.72,
                  child: PrintTransaction(_transaction, _removeItem))
        // TransactionList(),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startNewInput(context),
        child: const Icon(
          Icons.add_circle,
          size: 35,
        ),
      ),
    );
  }
}
