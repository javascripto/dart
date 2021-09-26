import 'package:flutter/material.dart';

ThemeData defaultTheme() => ThemeData(
  primaryColor: Colors.green[900],
  accentColor: Colors.green[700],
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.green[700]),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.green[700],
    foregroundColor: Colors.white,
  ),
);
