import 'package:expenses_app/expenses_list/expenses_list.dart';
import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  //bottim notification
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewExpense(
          onAddExpense: _addExpenses,
        );
      },
    );
  }

  void _addExpenses(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registerExpenses.indexOf(expense);
    setState(() {
      _registerExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense Deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registerExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  final List<Expense> _registerExpenses = [
    Expense(
      amount: 19.99,
      title: 'Flutter course',
      dateTime: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      amount: 29.99,
      title: 'Cinema',
      dateTime: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLutter Expense Tracker'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: _showBottomSheet,
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Chart'),
          ),
          Expanded(
            child: ExpenseList(
              data: _registerExpenses,
              onRemoveExpense: _removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
