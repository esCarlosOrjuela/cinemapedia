import 'package:flutter/material.dart';

import '../custom_text_theme.dart';
import 'dark_generic_colors.dart';

class DarkTheme {
  static get themeData => ThemeData(
        brightness: Brightness.dark,
        extensions: const [_textTheme],
        useMaterial3: true,
      );

  static const _textTheme = CustomTextTheme(
    title: TextStyle(
      fontSize: 24,
      letterSpacing: 1,
      color: DarkGenericColors.white,
    ),
    subtitle: TextStyle(
      color: DarkGenericColors.white,
    ),
    button: TextStyle(
      fontSize: 10,
      wordSpacing: 5.9,
      fontWeight: FontWeight.bold,
    ),
  );
}
