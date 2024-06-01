import 'package:flutter/material.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';

class CustomThemes {
  static ThemeData primaryTheme = ThemeData(
    primaryColor: CColors.primaryColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: CColors.purple,
      secondary: CColors.green,
      onPrimary: CColors.white,
      onSecondary: CColors.black,
      error: CColors.error,
      onError: CColors.white,
      background: CColors.background,
      onBackground: CColors.black,
      surface: CColors.white,
      onSurface: CColors.black,
      onSecondaryContainer: CColors.purple,
      tertiary: CColors.black,
    ),
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: CColors.background,
      elevation: 0,
      iconTheme: IconThemeData(
        color: CColors.black,
      ),
    ),
  );
}
