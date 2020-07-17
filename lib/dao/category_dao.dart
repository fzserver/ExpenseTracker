import 'package:expense_tracker/database/app_database.dart';
import 'package:expense_tracker/models/category.dart';
import 'package:sembast/sembast.dart';

class CategoryDao {
  static const String folderName = 'categories';
  final _categoryFolder = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Category category) async {
    await _categoryFolder.add(await _db, category.toJson());
  }

  Future<List<Category>> findAll() async {
    final recordSnapshot = await _categoryFolder.find(await _db);

    return recordSnapshot.map((snapshot) {
      final category = Category.fromJson(snapshot.value);

      category.id = snapshot.key;

      return category;
    }).toList();
  }

  Future deleteAll() async {
    await _categoryFolder.delete(await _db);
  }
}
