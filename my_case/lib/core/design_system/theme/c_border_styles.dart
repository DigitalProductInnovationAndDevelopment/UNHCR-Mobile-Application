import 'package:flutter/material.dart';
import 'c_colors.dart';

class CustomBorderStyles {
  static OutlineInputBorder primaryBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: CColors.primaryColor.withOpacity(0.5),
      width: 1,
    ),
    borderRadius: BorderRadius.circular(16),
  );
}
