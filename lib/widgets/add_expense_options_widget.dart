import 'package:expense_tracker/helpers/app_constants.dart';
import 'package:expense_tracker/screens/add_expense_screen.dart';
import 'package:expense_tracker/screens/text_detect_screen.dart';
import 'package:flutter/material.dart';

class AddExpenseOptionsWidget extends StatefulWidget {
  @override
  _AddExpenseOptionsWidgetState createState() =>
      _AddExpenseOptionsWidgetState();
}

class _AddExpenseOptionsWidgetState extends State<AddExpenseOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.PADDING_2XL),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            textColor: AppConstants.BUTTON_TEXT_COLOR,
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.PADDING_2XL),
              child: Text(
                'Camera',
                style: TextStyle(
                  fontSize: AppConstants.FONT_3XL,
                ),
              ),
            ),
          ),
          SizedBox(
            height: AppConstants.HEIGHT_L,
          ),
          RaisedButton(
            textColor: AppConstants.BUTTON_TEXT_COLOR,
            onPressed: () {
              Navigator.of(context).pop();
              // await Future.delayed(Duration(milliseconds: 400));
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => TextDetectScreen(),
              ));
            },
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.PADDING_2XL),
              child: Text(
                'Album',
                style: TextStyle(
                  fontSize: AppConstants.FONT_3XL,
                ),
              ),
            ),
          ),
          SizedBox(
            height: AppConstants.HEIGHT_L,
          ),
          RaisedButton(
            textColor: AppConstants.BUTTON_TEXT_COLOR,
            onPressed: () async {
              Navigator.of(context).pop();
              // await Future.delayed(Duration(milliseconds: 400));
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => AddExpenseScreen(),
              ));
            },
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.PADDING_2XL),
              child: Text(
                'Manual',
                style: TextStyle(
                  fontSize: AppConstants.FONT_3XL,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
