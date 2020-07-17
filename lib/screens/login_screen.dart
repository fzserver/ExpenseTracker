import 'package:expense_tracker/helpers/app_constants.dart';
import 'package:expense_tracker/screens/sign_up_screen.dart';
import 'package:expense_tracker/screens/dashboard_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.SCAFFOLD_BG_COLOR,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppConstants.BORDER_3XL),
                    topRight: Radius.circular(AppConstants.BORDER_3XL),
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(AppConstants.PADDING_2XL),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: AppConstants.HEIGHT_XL,
                      ),
                      Text(
                        'Please sign in to continue',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppConstants.FONT_L,
                          color: AppConstants.GRAY_TEXT_COLOR,
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
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (_) => DashboardScreen(),
                            ),
                            (_) => false,
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppConstants.BORDER_3XL),
                        ),
                        color: AppConstants.BUTTON_BG_COLOR,
                        textColor: AppConstants.BUTTON_TEXT_COLOR,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.PADDING_4XL,
                            vertical: AppConstants.PADDING_L,
                          ),
                          child: Text('Login'),
                        ),
                      ),
                      SizedBox(
                        height: AppConstants.HEIGHT_2XL,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Don\'t have an account? ',
                              style: TextStyle(
                                color: AppConstants.GRAY_TEXT_COLOR,
                                fontWeight: FontWeight.bold,
                                fontSize: AppConstants.FONT_XL,
                              ),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => SignUpScreen(),
                                  ));
                                },
                              text: 'Sign Up',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
