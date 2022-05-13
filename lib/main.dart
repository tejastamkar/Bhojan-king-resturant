import 'package:flutter/material.dart';
import 'package:restroapp/screens/loginscreen.dart';
// import 'package:restroapp/screens/signinpage.dart';

void main() {
  runApp(
    MaterialApp(
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(179, 19, 64, 1),
          primaryColorLight: const Color.fromRGBO(254, 251, 251, 1),
          fontFamily: 'Poppins',
          textTheme: const TextTheme(
            headline1: TextStyle(color: Colors.black),
          ),
        ),
        home: const LoginScreen()),
  );
}
