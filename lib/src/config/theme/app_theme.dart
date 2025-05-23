import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;

  static const Color appBlue = Color(0xFF004A77);
  static const Color appLightBlue = Color(0xFF4498E7);
  static const Color appPink = Color(0xffff0069);
  static const Color appLightGray = Color(0xfff1f1f1);
  static const Color appYellow = Color(0xffffd700);
  static const Color appGray = Color(0xff92a0a9);
  static const Color appLightGreen = Color(0xff00ff98);
  static const Color appBlueGray = Color(0xffecf0f3);
  static const Color appDarkGray = Color(0xffd9d9d9);

  AppTheme({this.selectedColor = 0})
    : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
      assert(
        selectedColor < colorList.length,
        'Selected color must be less or equal than ${colorList.length - 1}',
      );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(centerTitle: false),
    colorScheme: ColorScheme.fromSeed(
      seedColor: appPink,
      primary: appPink,
      secondary: appYellow,
    ),
  ).copyWith(
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        textStyle: const WidgetStatePropertyAll(TextStyle(fontSize: 18)),
        fixedSize: const WidgetStatePropertyAll(Size.fromWidth(320)),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    ),
  );
}
