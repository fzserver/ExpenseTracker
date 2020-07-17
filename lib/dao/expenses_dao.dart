import 'package:expense_tracker/database/app_database.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:sembast/sembast.dart';

class ExpensesDao {
  static const String folderName = 'expenses';
  final _expensesFolder = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Expense expense) async {
    await _expensesFolder.add(await _db, expense.toJson());
  }

  Future<List<Expense>> findAll() async {
    final recordSnapshot = await _expensesFolder.find(await _db);

    return recordSnapshot.map((snapshot) {
      final expense = Expense.fromJson(snapshot.value);
      expense.id = snapshot.key;

      return expense;
    }).toList();
  }

  Future delete(Expense expense) async {
    final finder = Finder(filter: Filter.byKey(expense.id));

    await _expensesFolder.delete(await _db, finder: finder);
  }
}
