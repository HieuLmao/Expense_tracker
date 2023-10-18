import 'package:expenses_app/expenses_list/expense_item.dart';
import 'package:expenses_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> data;
  final void Function(Expense expense) onRemoveExpense;
  const ExpenseList(
      {super.key, required this.data, required this.onRemoveExpense});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(data[index]),
            onDismissed: (direction) {
              onRemoveExpense(data[index]);
            },
            child: ExpenseItem(
              expense: data[index],
            ),
          );
        },
      ),
    );
  }
}
