import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;
  Color get buttonColor => Theme.of(this).highlightColor;
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle get titleStyle => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.grey
  );
  TextStyle get subTitleStyle14 => const TextStyle(
    fontSize: 14,
    color: Colors.grey
  );
  TextStyle get subTitleStyle12 => const TextStyle(
    fontSize: 12,
    color: Colors.grey
  );
  
}