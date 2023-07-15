import 'package:flutter/material.dart';

class CustomTheme {
  static final ThemeData toastTheme = ThemeData(
    appBarTheme: const AppBarTheme(centerTitle: true),
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.light(
      surfaceVariant: Colors.green,
      error: Colors.red,
    ),
  );

  static final ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[300],
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 0, 67, 104),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange[700],
        textStyle: const TextStyle(color: Colors.white),
      ),
    ),
    primaryColor: Colors.black,
  );
}
