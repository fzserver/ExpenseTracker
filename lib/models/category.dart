import 'package:flutter/material.dart';

class Category {
  int id;

  String title;
  IconData iconData;

  Category({this.title});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(title: json['title']);

  Map<String, dynamic> toJson() => {
        'title': title,
      };
}
