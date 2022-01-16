import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/widget/chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<TransAction> recentTransaction;
  Chart(this.recentTransaction);
  List<Map<String, Object>> get groupdTransactions {
    return List.generate(7, (index) {
      var weekday = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalAmount = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekday.day &&
            recentTransaction[i].date.month == weekday.month &&
            recentTransaction[i].date.year == weekday.year) {
          totalAmount += recentTransaction[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekday).substring(0, 2),
        'amount': totalAmount
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupdTransactions.fold(0.0, (sum, element) {
      return sum + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 7,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...groupdTransactions.map((data) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    data['day'],
                    data['amount'],
                    totalSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalSpending,
                  ),
                );
              }).toList(),
            ],
          ),
        ));
  }
}
