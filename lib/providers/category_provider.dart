import 'package:expense_tracker/dao/category_dao.dart';
import 'package:expense_tracker/models/category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryDao _categoryDao = CategoryDao();
  List<Category> _categories;

  List<Category> get categories {
    if (_categories == null) {
      fetchCategoryList();
    }

    _categories = List();

    _categories.add(Category(title: 'Automobile'));
    _categories.add(Category(title: 'Fuel'));
    _categories.add(Category(title: 'Clothes'));
    _categories.add(Category(title: 'Meal'));
    _categories.add(Category(title: 'Gifts'));
    _categories.add(Category(title: 'Internet'));

    _categories[0].iconData = FontAwesomeIcons.car;
    _categories[1].iconData = FontAwesomeIcons.gasPump;
    _categories[2].iconData = FontAwesomeIcons.tshirt;
    _categories[3].iconData = FontAwesomeIcons.pizzaSlice;
    _categories[4].iconData = FontAwesomeIcons.gifts;
    _categories[5].iconData = FontAwesomeIcons.wifi;

    return _categories;
  }

  Future fetchCategoryList() async {
    _categories = await _categoryDao.findAll();

    if (_categories.length == 0) {
      await saveDefaultCategory();
    }

    notifyListeners();
  }

  Future save(Category category) async {
    await _categoryDao.insert(category);

    fetchCategoryList();
  }

  Future deleteAll() async {
    await _categoryDao.deleteAll();
    fetchCategoryList();
  }

  Future saveDefaultCategory() async {
    List<Category> categoryList = List();

    categoryList.add(Category(title: 'Automobile'));
    categoryList.add(Category(title: 'Fuel'));
    categoryList.add(Category(title: 'Clothes'));
    categoryList.add(Category(title: 'Meal'));
    categoryList.add(Category(title: 'Gifts'));
    categoryList.add(Category(title: 'Internet'));

    List<Future> futures = List();

    for (Category category in categoryList) {
      futures.add(save(category));
    }

    await Future.wait(futures);
  }
}
