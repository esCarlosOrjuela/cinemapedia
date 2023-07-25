// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ThemeManager {
  static ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);

  static switchTheme() => themeMode.value =
      themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

  static bool get isLightTheme => themeMode.value == ThemeMode.light;
}
