import 'package:expense_tracker/helpers/app_constants.dart';
import 'package:expense_tracker/providers/category_provider.dart';
import 'package:expense_tracker/providers/expenses_provider.dart';
import 'package:expense_tracker/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExpensesProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          iconTheme: IconThemeData(color: Color(0xFF7CC638)),
          buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppConstants.BORDER_M,
              ),
            ),
            buttonColor: AppConstants.BUTTON_BG_COLOR,
            height: 50,
          ),
          appBarTheme: AppBarTheme(
            color: AppConstants.APPBAR_BG_COLOR,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: AppConstants.FAB_BG_COLOR,
          ),
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
