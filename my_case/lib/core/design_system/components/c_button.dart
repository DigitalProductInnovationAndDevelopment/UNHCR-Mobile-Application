import 'package:flutter/material.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';

class CButton extends StatelessWidget {
  final String text;
  final double verticalMargin;
  final double horizontalMargin;
  final double verticalPadding;
  final double horizontalPadding;
  final AxisDirection? iconPosition;
  final VoidCallback onTap;
  final bool isDisabled;
  final Color? color;
  final Color? textColor;
  final Color? iconColor;
  final Color? disabledColor;
  final IconData? icon;
  final double iconSize;
  final bool isTextLeftLined;
  final double textFontSize;
  final double? width;
  final bool showShadow;
  final Color? borderColor;
  const CButton({
    super.key,
    required this.text,
    this.verticalMargin = 0,
    this.horizontalMargin = 0,
    this.verticalPadding = 16,
    this.horizontalPadding = 0,
    this.iconPosition,
    required this.onTap,
    this.isDisabled = false,
    this.color = CColors.primaryColor,
    this.textColor = CColors.white,
    this.iconColor = CColors.black,
    this.icon,
    this.iconSize = 25,
    this.isTextLeftLined = false,
    this.disabledColor,
    this.textFontSize = 16,
    this.width,
    this.showShadow = false,
    this.borderColor = CColors.primaryColor,
  });

  get buttonColor {
    if (isDisabled) {
      return disabledColor ?? CColors.grey;
    } else {
      return color;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: CColors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ]
            : null,
      ),
      child: GestureDetector(
        onTap: isDisabled ? () {} : onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: verticalMargin),
          child: Container(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              border: Border.all(
                color: borderColor ?? buttonColor,
                width: 1,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (iconPosition != null && iconPosition != AxisDirection.left && !isTextLeftLined)
                  SizedBox(
                    width: iconSize,
                  ),
                if (iconPosition == AxisDirection.left)
                  Icon(
                    icon,
                    color: iconColor,
                    size: iconSize,
                  ),
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: textFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (iconPosition != null && iconPosition != AxisDirection.right)
                  const SizedBox(
                    width: 20,
                  ),
                if (iconPosition == AxisDirection.right)
                  Icon(
                    icon,
                    color: iconColor,
                    size: iconSize,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
