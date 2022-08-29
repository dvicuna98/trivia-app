
import 'package:flutter/material.dart';

class AppTheme{

  static const Color primary = Color(0xFF8549E5);

  static final ThemeData lightTheme = ThemeData.light().copyWith(

    primaryColor: primary,

    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 5
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: primary
      )
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 5
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primary,
        shape: const StadiumBorder(),
        elevation: 2
      )
    ),

    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(
        color: primary
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
      )
    )


  );

}