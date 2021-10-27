import 'package:flutter/material.dart';
import 'SigninPage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0,
            foregroundColor: Colors.white,
          ),
          accentColor: Colors.blueGrey,
          textTheme: TextTheme(
              headline1: TextStyle(fontSize: 22.0, color: Colors.blueGrey),
              headline2: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: Colors.blueGrey,
              ),
              bodyText1: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.blueAccent,
              ))),
      home: LoginPage(),
    );
  }
}

//https://reqres.in/