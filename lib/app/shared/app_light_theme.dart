import 'package:flutter/material.dart';
import 'package:your_tracker/app/shared/app_colors.dart';

final class AppLightTheme {
  static ThemeData get theme => ThemeData(
        fontFamily: 'Ubuntu',
        textTheme: _textThemeData(),
        inputDecorationTheme: _inputDecorationTheme(),
      );

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.blackWith30Opacity,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 0.3,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 0.5,
          color: AppColors.black,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 0.5,
          color: AppColors.redWith80Opacity,
        ),
      ),
      hintStyle: TextStyle(
        fontWeight: FontWeight.w700,
        color: AppColors.blackWith60Opacity,
      ),
    );
  }

  static TextTheme _textThemeData() {
    return const TextTheme(
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
