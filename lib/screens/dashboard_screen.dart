import 'package:expense_tracker/screens/reports_page.dart';
import 'package:expense_tracker/screens/settings_page.dart';
import 'package:expense_tracker/screens/transactions_page.dart';
import 'package:expense_tracker/widgets/add_expense_options_widget.dart';
import 'package:expense_tracker/widgets/curved_bottom_navigation_bar.dart';
import 'package:expense_tracker/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Widget> _pagesList = [
    HomePage(),
    TransactionsPage(),
    ReportsPage(),
    SettingsPage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        heroTag: 'uploadFile',
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (builder) {
              return AddExpenseOptionsWidget();
            },
          );
        },
        child: FaIcon(FontAwesomeIcons.upload),
      ),
      bottomNavigationBar: CurvedBottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedColor: Color(0xFF7CC638),
        unSelectedColor: Colors.grey,
      ),
      body: _pagesList[_currentIndex],
    );
  }
}
