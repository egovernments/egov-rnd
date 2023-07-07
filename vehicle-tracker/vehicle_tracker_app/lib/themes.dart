import 'package:flutter/material.dart';

class CustomTheme {
  static final ThemeData toastTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    appBarTheme: const AppBarTheme(centerTitle: true),
    useMaterial3: true,
    primaryColor: Colors.black,
  );
}
