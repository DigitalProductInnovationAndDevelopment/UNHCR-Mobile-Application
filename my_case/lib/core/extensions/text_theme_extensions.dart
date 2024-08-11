import 'package:flutter/material.dart';

extension CustomTextStyles on BuildContext {
  TextStyle textStyle(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontSize: fontSize,
      color: Theme.of(this).colorScheme.onSurface,
      fontWeight: fontWeight,
    );
  }

  TextStyle get text48 => textStyle(48.0, FontWeight.w500);
  TextStyle get text48Bold => textStyle(48.0, FontWeight.w700);
  TextStyle get text40Bold => textStyle(40.0, FontWeight.w700);
  TextStyle get text24 => textStyle(24.0, FontWeight.w500);
  TextStyle get text24Bold => textStyle(24.0, FontWeight.w700);
  TextStyle get text20 => textStyle(20.0, FontWeight.w500);
  TextStyle get text20Bold => textStyle(20.0, FontWeight.w700);
  TextStyle get text20Light => textStyle(20.0, FontWeight.w300);
  TextStyle get text10 => textStyle(10.0, FontWeight.w500);
  TextStyle get text32ExtraBold => textStyle(32.0, FontWeight.w900);
  TextStyle get text32Bold => textStyle(32.0, FontWeight.w700);
  TextStyle get text28ExtraBold => textStyle(28.0, FontWeight.w900);
  TextStyle get text28 => textStyle(28.0, FontWeight.w500);
  TextStyle get text28Bold => textStyle(28.0, FontWeight.w700);
  TextStyle get text36ExtraBold => textStyle(36.0, FontWeight.w900);
  TextStyle get text16Bold => textStyle(16.0, FontWeight.w700);
  TextStyle get text16Light => textStyle(16.0, FontWeight.w300);
  TextStyle get text16 => textStyle(16.0, FontWeight.w500);
  TextStyle get text14Bold => textStyle(14.0, FontWeight.w700);
  TextStyle get text14Light => textStyle(14.0, FontWeight.w300);
  TextStyle get text14 => textStyle(14.0, FontWeight.w500);
  TextStyle get text18Bold => textStyle(18.0, FontWeight.w700);
  TextStyle get text18Light => textStyle(18.0, FontWeight.w300);
  TextStyle get text18 => textStyle(18.0, FontWeight.w500);
  TextStyle get text12 => textStyle(12.0, FontWeight.w500);
  TextStyle get text12Bold => textStyle(12.0, FontWeight.w700);
  TextStyle get text12Light => textStyle(12.0, FontWeight.w300);
  TextStyle get text8 => textStyle(8.0, FontWeight.w500);
  TextStyle get text8Bold => textStyle(8.0, FontWeight.w700);
}

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
