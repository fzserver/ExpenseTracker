import 'package:expense_tracker/models/category.dart';
import 'package:intl/intl.dart';

class Expense {
  int id;

  double amount;
  String description;
  DateTime dateTime;

  Category category;

  Expense({this.amount, this.description, this.dateTime, this.category});

  Expense.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    description = json['description'];
    dateTime = DateFormat.yMd().parse(json['dateTime']);
    category = Category.fromJson(json['category']);
  }

  Map<String, dynamic> toJson() => {
        'amount': this.amount,
        'description': this.description,
        'dateTime': DateFormat.yMd().format(this.dateTime),
        'category': this.category.toJson(),
      };
}
