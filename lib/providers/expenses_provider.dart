import 'package:expense_tracker/dao/expenses_dao.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesProvider extends ChangeNotifier {
  ExpensesDao _expensesDao = ExpensesDao();
  List<Expense> _expenses;

  List<Expense> get expenses {
    if (_expenses == null) {
      fetchExpensesList();
    }

    return _expenses;
  }

  Future save(Expense expense) async {
    await _expensesDao.insert(expense);

    // _expenses.add(expense);
    fetchExpensesList();

    notifyListeners();
  }

  Future fetchExpensesList() async {
    _expenses = await _expensesDao.findAll();

    notifyListeners();
  }

  Future delete(Expense expense) async {
    await _expensesDao.delete(expense);

    fetchExpensesList();
  }
}
