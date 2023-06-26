import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BarChat extends StatelessWidget {
  // const BarChat({super.key});

  final lable;
  final amount;
  final totalSpendRatio;

  BarChat({this.lable, this.amount, this.totalSpendRatio});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, Constraints) {
      return Column(
        children: [
          Container(
              height: Constraints.maxHeight * 0.15,
              child: FittedBox(child: Text('\$${amount.toStringAsFixed(0)}'))),
          SizedBox(
            height: Constraints.maxHeight * 0.05,
          ),
          Container(
              height: Constraints.maxHeight * 0.60,
              width: 10,
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Color.fromRGBO(220, 220, 220, 1)),
                ),
                FractionallySizedBox(
                  heightFactor: totalSpendRatio,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ])),
          SizedBox(
            height: Constraints.maxHeight * 0.05,
          ),
          Container(
              height: Constraints.maxHeight * 0.15, child: Text('$lable')),
        ],
      );
    });
  }
}
