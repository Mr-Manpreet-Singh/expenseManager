import 'package:expense_tracker/widgets/barChat.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/Transaction.dart';

class Chart extends StatelessWidget {
  // const Chart({super.key});

  final List<Transaction> recentTransactionList; // variable
  Chart(this.recentTransactionList); // constructor

  List<Map<String, Object>> get groupedTransaction {
    // groupedTran..return list
    return (List.generate(
      7,
      (index) {
        //iterating element in list(len=7) using index
        final weekday = DateTime.now().subtract(Duration(days: index));
        var totalAmount = 0.0;
        //iterating in user transactionlisyt
        for (int i = 0; i < recentTransactionList.length; i++) {
          // calculation of particular day in month,yr means matrix of a particular month
          if (weekday.day == recentTransactionList[i].date.day &&
              weekday.month == recentTransactionList[i].date.month &&
              weekday.year == recentTransactionList[i].date.year) {
            totalAmount += recentTransactionList[i].amount;
          }
        }
        //returning map one by one to generate list of map<str,obj>
        return {
          'day': DateFormat.E().format(weekday).substring(0, 1),
          'amount': totalAmount,
        };
      },
    )).reversed.toList();
  }

  double get totalSum {
    return groupedTransaction.fold(0.0, (element, item) {
      return element + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransaction);
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(18),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransaction.map((data) {
            // return Text('${data['day']} : ${data['amount']}');
            return BarChat(
              lable: data['day'],
              amount: data['amount'],
              totalSpendRatio:
                  totalSum == 0 ? 0.0 : (data['amount'] as double) / totalSum,
            );
          }).toList(),
        ),
      ),
    );
    
  }
}
