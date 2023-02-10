import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    //color primario
    primaryColor: Colors.indigo,

    //AppBar Teme
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),

    //TextButtom Theme
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: Colors.indigo)),
  );
}
