import 'package:expense_tracker/helpers/app_constants.dart';
import 'package:expense_tracker/models/category.dart';
import 'package:expense_tracker/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CategoryListScreen extends StatefulWidget {
  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Category'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Category category = await _showAddCategoryDialog();
              if (category != null) await categoryProvider.save(category);

              // categoryProvider.deleteAll();
            },
            child: FaIcon(FontAwesomeIcons.plus),
          ),
          body: Container(
            child: categoryProvider.categories != null
                ? categoryProvider.categories.length != 0
                    ? ListView.builder(
                        itemCount: categoryProvider.categories.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .pop(categoryProvider.categories[index]);
                            },
                            title: Text(
                              '${categoryProvider.categories[index].title}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: AppConstants.FONT_XL,
                              ),
                            ),
                          );
                        },
                      )
                    : Text('No Category Found. Please Add One')
                : Text('No Category Found. Please Add One'),
          ),
        );
      },
    );
  }

  _showAddCategoryDialog() async {
    String categoryTitle = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.BORDER_2XL),
          ),
          child: Container(
            padding: EdgeInsets.all(AppConstants.PADDING_2XL),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Add New Category',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: AppConstants.HEIGHT_2XL,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Category Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: _categoryController,
                    ),
                  ],
                ),
                SizedBox(
                  height: AppConstants.HEIGHT_2XL,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        _categoryController.clear();
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                      textColor: AppConstants.BUTTON_BG_COLOR,
                    ),
                    SizedBox(
                      width: AppConstants.WIDTH_L,
                    ),
                    RaisedButton(
                      onPressed: () {
                        String categoryTitle = _categoryController.value.text;

                        _categoryController.clear();
                        Navigator.of(context).pop(categoryTitle);
                      },
                      child: Text('Add'),
                      textColor: AppConstants.BUTTON_TEXT_COLOR,
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    if (categoryTitle != null) {
      Category category = Category(title: categoryTitle);

      return category;
    }
    return null;
  }
}
