import 'package:expense_tracker/providers/expenses_provider.dart';
import 'package:expense_tracker/widgets/expenses_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionsPage extends StatefulWidget {
  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpensesProvider>(
      builder: (context, expensesProvider, _) {
        return ExpensesListWidget(
          expensesList: expensesProvider.expenses,
        );
      },
    );
  }
}
