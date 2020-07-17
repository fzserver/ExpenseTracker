import 'package:expense_tracker/helpers/app_constants.dart';
import 'package:expense_tracker/models/category.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/providers/category_provider.dart';
import 'package:expense_tracker/providers/expenses_provider.dart';
import 'package:expense_tracker/screens/category_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddExpenseScreen extends StatefulWidget {
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  ExpensesProvider _expensesProvider;
  CategoryProvider _categoryProvider;

  int _selectedIndex = -1;

  TextEditingController _amountController = TextEditingController(),
      _descriptionController = TextEditingController();

  DateTime _expenseDateTime = DateTime.now();

  Category _category;

  @override
  Widget build(BuildContext context) {
    _expensesProvider = Provider.of<ExpensesProvider>(context);
    _categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('New Expense'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppConstants.PADDING_S),
        child: Column(
          children: <Widget>[
            Card(
              child: Container(
                padding: EdgeInsets.all(AppConstants.PADDING_XL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Amount',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppConstants.FONT_L,
                      ),
                    ),
                    TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppConstants.FONT_2XL,
                        color: AppConstants.GRAY_TEXT_COLOR,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter',
                      ),
                    ),
                    SizedBox(height: AppConstants.HEIGHT_M),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            DateFormat.MMMMEEEEd().format(_expenseDateTime),
                            style: TextStyle(
                              color: AppConstants.PRIMARY_TEXT_COLOR,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            DateTime newDateTime = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2015),
                              lastDate: DateTime(2100),
                            );

                            if (newDateTime != null) {
                              setState(() {
                                _expenseDateTime = newDateTime;
                              });
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.all(AppConstants.PADDING_M),
                            child: FaIcon(
                              FontAwesomeIcons.solidCalendarAlt,
                              color: AppConstants.GRAY_TEXT_COLOR,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(AppConstants.PADDING_XL),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Select Category',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppConstants.FONT_L,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            _category = await Navigator.of(context)
                                .push(MaterialPageRoute(
                              builder: (_) => CategoryListScreen(),
                            ));

                            setState(() {});
                          },
                          child: Text(
                            'View All',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppConstants.PRIMARY_TEXT_COLOR,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppConstants.HEIGHT_S,
                    ),
                    // GestureDetector(
                    //   onTap: () async {
                    //     _category =
                    //         await Navigator.of(context).push(MaterialPageRoute(
                    //       builder: (_) => CategoryListScreen(),
                    //     ));

                    //     setState(() {});

                    //     // if (selectedCategory != null) {
                    //     //   _category = selectedCategory;
                    //     //   setState(() {});
                    //     // }
                    //   },
                    //   child: Container(
                    //     padding: EdgeInsets.symmetric(
                    //         vertical: AppConstants.PADDING_L),
                    //     decoration: BoxDecoration(
                    //       border: Border(
                    //         bottom: BorderSide(),
                    //       ),
                    //     ),
                    //     child: Row(
                    //       children: <Widget>[
                    //         Expanded(
                    //           child: Text(
                    //             _category == null
                    //                 ? 'Select Category'
                    //                 : _category.title,
                    //             style: TextStyle(
                    //               fontWeight: FontWeight.bold,
                    //               color: _category == null
                    //                   ? AppConstants.GRAY_TEXT_COLOR
                    //                   : AppConstants.PRIMARY_TEXT_COLOR,
                    //             ),
                    //           ),
                    //         ),
                    //         FaIcon(
                    //           FontAwesomeIcons.chevronRight,
                    //           size: 16,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    GridView.builder(
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      padding: EdgeInsets.all(AppConstants.PADDING_S),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        Category category = _categoryProvider.categories[index];
                        return Card(
                          elevation: _selectedIndex == index ? 5 : 2,
                          borderOnForeground: true,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppConstants.BORDER_L),
                            side: BorderSide(
                              color: _selectedIndex == index
                                  ? AppConstants.PRIMARY_COLOR
                                  : Colors.white,
                              width: 2,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                                _category = _categoryProvider.categories[index];
                              });
                            },
                            child: Container(
                              height: 75,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Center(
                                      child: FaIcon(
                                        category.iconData,
                                        color: _selectedIndex == index
                                            ? AppConstants.ICON_SELECTED_COLOR
                                            : AppConstants.ICON_PRIMARY_COLOR,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    category.title,
                                    style: TextStyle(
                                      color: _selectedIndex == index
                                          ? AppConstants.PRIMARY_COLOR
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppConstants.HEIGHT_M,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      // crossAxisSpacing: 10,
                      // mainAxisSpacing: 10,
                      shrinkWrap: true,
                      // crossAxisCount: 3,
                    ),
                    SizedBox(
                      height: AppConstants.HEIGHT_2XL,
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppConstants.FONT_L,
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.HEIGHT_S,
                    ),
                    TextField(
                      controller: _descriptionController,
                      maxLines: 3,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Write Here',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(AppConstants.PADDING_XL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Add Photo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppConstants.FONT_L,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppConstants.HEIGHT_L,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {},
                      child: FaIcon(
                        FontAwesomeIcons.plus,
                        color: AppConstants.ICON_PRIMARY_COLOR,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppConstants.HEIGHT_L,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: _addNewExpense,
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: AppConstants.BUTTON_TEXT_COLOR,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: AppConstants.HEIGHT_M,
            // ),
          ],
        ),
      ),
    );
  }

  void _addNewExpense() async {
    Expense expense = Expense(
      amount: double.parse(_amountController.value.text),
      description: _descriptionController.value.text,
      dateTime: _expenseDateTime,
      category: _category,
    );

    await _expensesProvider.save(expense);

    Navigator.of(context).pop();
  }
}
