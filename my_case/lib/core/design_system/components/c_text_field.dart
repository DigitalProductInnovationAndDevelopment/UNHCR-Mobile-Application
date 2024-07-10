import 'package:flutter/material.dart';
import 'package:my_case/core/design_system/theme/c_border_styles.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';

class CTextField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final double? horizontalPadding;
  final bool? isPassword;
  final bool? isDisabled;
  final TextEditingController controller;
  const CTextField({
    super.key,
    this.title,
    this.horizontalPadding,
    this.hintText,
    this.isPassword,
    this.isDisabled,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title ?? '',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextField(
            obscureText: isPassword ?? false,
            controller: controller,
            cursorColor: CColors.primaryColor,
            enabled: isDisabled == null ? true : !isDisabled!,
            decoration: InputDecoration(
              hintText: hintText,
              focusedBorder: CustomBorderStyles.primaryBorder,
              enabledBorder: CustomBorderStyles.primaryBorder,
              border: CustomBorderStyles.primaryBorder,
              fillColor: Colors.white,
              focusColor: Colors.white,
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}
