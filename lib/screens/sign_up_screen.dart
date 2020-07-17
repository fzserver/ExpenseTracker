import 'package:expense_tracker/helpers/app_constants.dart';
import 'package:expense_tracker/screens/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 32,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppConstants.PADDING_2XL),
        child: Column(
          children: <Widget>[
            Text(
              'Let\'s get started',
              style: Theme.of(context).textTheme.headline5.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: AppConstants.HEIGHT_XL,
            ),
            Text(
              'Create an account',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppConstants.GRAY_TEXT_COLOR,
              ),
            ),
            SizedBox(
              height: AppConstants.HEIGHT_XL,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                  fontSize: AppConstants.FONT_XL,
                ),
                prefixIcon: Icon(FontAwesomeIcons.userAlt),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    AppConstants.BORDER_3XL,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppConstants.HEIGHT_XL,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontSize: AppConstants.FONT_XL,
                ),
                prefixIcon: Icon(FontAwesomeIcons.at),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    AppConstants.BORDER_3XL,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppConstants.HEIGHT_XL,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  fontSize: AppConstants.FONT_XL,
                ),
                prefixIcon: Icon(FontAwesomeIcons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    AppConstants.BORDER_3XL,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppConstants.HEIGHT_3XL,
            ),
            RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.BORDER_3XL),
              ),
              color: AppConstants.BUTTON_BG_COLOR,
              textColor: AppConstants.BUTTON_TEXT_COLOR,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.PADDING_4XL,
                  vertical: AppConstants.PADDING_L,
                ),
                child: Text('Sign Up'),
              ),
            ),
            SizedBox(
              height: AppConstants.HEIGHT_2XL,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: AppConstants.GRAY_TEXT_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: AppConstants.FONT_XL,
                    ),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (_) => LoginScreen(),
                          ),
                          (_) => false,
                        );
                      },
                    text: 'Login',
                    style: TextStyle(
                      color: AppConstants.PRIMARY_TEXT_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: AppConstants.FONT_XL,
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
}
