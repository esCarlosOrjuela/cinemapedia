// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextTheme extends ThemeExtension<CustomTextTheme> {
  final TextStyle? title;
  final TextStyle? subtitle;
  final TextStyle? button;

  const CustomTextTheme({
    required this.title,
    required this.subtitle,
    required this.button,
  });

  @override
  CustomTextTheme copyWith({
    TextStyle? title,
    TextStyle? subtitle,
    TextStyle? button,
  }) {
    return CustomTextTheme(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      button: button ?? this.button,
    );
  }

  @override
  ThemeExtension<CustomTextTheme> lerp(
    ThemeExtension<CustomTextTheme>? other,
    double t,
  ) {
    if (other is! CustomTextTheme) return this;

    return CustomTextTheme(
      title: TextStyle.lerp(title, other.title, t),
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t),
      button: TextStyle.lerp(button, other.button, t),
    );
  }
}
