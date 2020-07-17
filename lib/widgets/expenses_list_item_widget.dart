import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/providers/expenses_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ExpensesListItemWidget extends StatefulWidget {
  final Expense expense;

  const ExpensesListItemWidget({Key key, @required this.expense})
      : super(key: key);
  @override
  _ExpensesListItemWidgetState createState() => _ExpensesListItemWidgetState();
}

class _ExpensesListItemWidgetState extends State<ExpensesListItemWidget> {
  final SlidableController slidableController = SlidableController();

  ExpensesProvider _expensesProvider;

  @override
  Widget build(BuildContext context) {
    _expensesProvider = Provider.of<ExpensesProvider>(context);
    return Slidable(
      key: Key('${widget.expense.id}'),
      controller: slidableController,
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      actions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: FontAwesomeIcons.trash,
          onTap: () async {
            await _expensesProvider.delete(widget.expense);
          },
        ),
      ],
      child: ListTile(
        title: Text('${widget.expense.category.title}'),
        subtitle: Text(DateFormat.yMd().format(widget.expense.dateTime)),
        onTap: () {},
      ),
    );
  }
}
