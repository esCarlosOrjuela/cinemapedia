import 'package:flutter/material.dart';

import '../custom_text_theme.dart';
import 'light_generic_colors.dart';

class LightTheme {
  static get themeData => ThemeData(
        brightness: Brightness.light,
        extensions: const [_textTheme],
        useMaterial3: true,
      );

  static const _textTheme = CustomTextTheme(
    subtitle: TextStyle(
      fontSize: 14,
      color: LightGenericColors.darkDenim,
    ),
    button: TextStyle(
      fontSize: 20,
      letterSpacing: 0.03,
    ),
    title: TextStyle(
      fontSize: 24,
      letterSpacing: 0.03,
      color: LightGenericColors.darkGrape,
    ),
  );
}
