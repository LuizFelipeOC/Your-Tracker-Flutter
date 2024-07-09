import 'package:flutter/material.dart';
import 'package:your_tracker/app/shared/app_colors.dart';

final class AppLightTheme {
  static ThemeData get theme => ThemeData(
        fontFamily: 'Ubuntu',
        textTheme: _textThemeData(),
        inputDecorationTheme: _inputDecorationTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            foregroundColor: const WidgetStatePropertyAll(AppColors.white),
            backgroundColor: const WidgetStatePropertyAll(AppColors.black),
          ),
        ),
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
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 20,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    );
  }
}
