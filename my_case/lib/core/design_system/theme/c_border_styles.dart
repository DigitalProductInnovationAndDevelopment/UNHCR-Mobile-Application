import 'package:flutter/material.dart';
import 'c_colors.dart';

class CustomBorderStyles {
  static OutlineInputBorder primaryBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: CColors.grey,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(30),
  );
}
