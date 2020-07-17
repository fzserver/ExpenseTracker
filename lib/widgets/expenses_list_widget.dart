import 'package:collection/collection.dart';
import 'package:expense_tracker/helpers/app_constants.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class ExpensesListWidget extends StatefulWidget {
  final List<Expense> expensesList;

  const ExpensesListWidget({Key key, @required this.expensesList})
      : super(key: key);
  @override
  _ExpensesListWidgetState createState() => _ExpensesListWidgetState();
}

class _ExpensesListWidgetState extends State<ExpensesListWidget> {
  Map<dynamic, List<Expense>> _groupedExpensesList;
  @override
  Widget build(BuildContext context) {
    return GroupedListView(
      padding: EdgeInsets.all(AppConstants.PADDING_S),
      elements: widget.expensesList,
      groupBy: (Expense obj) => DateFormat.yM().format(obj.dateTime),
      groupSeparatorBuilder: (value) => Text(
        value.toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: AppConstants.FONT_L,
        ),
      ),
      itemBuilder: (context, Expense element) =>
          ExpensesListItemWidget(expense: element),
    );
  }
}
