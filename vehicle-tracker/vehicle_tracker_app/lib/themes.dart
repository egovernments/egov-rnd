import 'package:flutter/material.dart';

class CustomTheme {
  static final ThemeData toastTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    appBarTheme: const AppBarTheme(centerTitle: true),
    useMaterial3: true,
    primaryColor: Colors.black,
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
