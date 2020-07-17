import 'package:expense_tracker/helpers/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CurvedBottomNavigationBar extends StatefulWidget {
  final Function onTap;
  final Color selectedColor;
  final Color unSelectedColor;

  const CurvedBottomNavigationBar({
    Key key,
    @required this.onTap,
    this.selectedColor,
    this.unSelectedColor,
  }) : super(key: key);
  @override
  _CurvedBottomNavigationBarState createState() =>
      _CurvedBottomNavigationBarState();
}

class _CurvedBottomNavigationBarState extends State<CurvedBottomNavigationBar> {
  int _selectedIndex = 0;
  double _selectedIconSize = 24, _unSelectedIconSize = 20;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      shape: CircularNotchedRectangle(),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _onItemSelected(0);
                    },
                    child: Container(
                      padding: EdgeInsets.all(AppConstants.PADDING_XL),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.home,
                            size: _selectedIndex == 0
                                ? _selectedIconSize
                                : _unSelectedIconSize,
                            color: _selectedIndex == 0
                                ? widget.selectedColor
                                : widget.unSelectedColor,
                          ),
                          // Text('Transaction'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _onItemSelected(1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(AppConstants.PADDING_XL),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.listUl,
                            size: _selectedIndex == 1
                                ? _selectedIconSize
                                : _unSelectedIconSize,
                            color: _selectedIndex == 1
                                ? widget.selectedColor
                                : widget.unSelectedColor,
                          ),
                          // Text('Transaction'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _onItemSelected(2);
                    },
                    child: Container(
                      padding: EdgeInsets.all(AppConstants.PADDING_XL),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.chartPie,
                            size: _selectedIndex == 2
                                ? _selectedIconSize
                                : _unSelectedIconSize,
                            color: _selectedIndex == 2
                                ? widget.selectedColor
                                : widget.unSelectedColor,
                          ),
                          // Text('Home'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _onItemSelected(3);
                    },
                    child: Container(
                      padding: EdgeInsets.all(AppConstants.PADDING_XL),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.tools,
                            size: _selectedIndex == 3
                                ? _selectedIconSize
                                : _unSelectedIconSize,
                            color: _selectedIndex == 3
                                ? widget.selectedColor
                                : widget.unSelectedColor,
                          ),
                          // Text('Transaction'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTap(index);
  }
}
