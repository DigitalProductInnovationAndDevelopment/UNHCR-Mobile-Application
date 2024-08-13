import 'package:flutter/material.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Color? backgroundColor;
  final double elevation;
  final Color? leadingColor;
  final Widget? title;
  final Widget? leading;
  final bool showSteps;
  final int? currentStep;
  final int? totalSteps;

  CAppBar({
    super.key,
    this.height = 60,
    this.backgroundColor = CColors.white,
    this.elevation = 0,
    this.leadingColor = Colors.black,
    this.title,
    this.leading,
    this.showSteps = false,
    this.currentStep,
    this.totalSteps,
  }) {
    assert(showSteps == false || (showSteps == true && currentStep != null && totalSteps != null));
  }

  @override
  Widget build(BuildContext context) {
    double percent = 0.0;
    if (showSteps && currentStep != null && totalSteps != null) {
      percent = currentStep! / totalSteps!;
    }

    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      automaticallyImplyLeading: true,
      centerTitle: true,
      scrolledUnderElevation: 0,
      bottom: showSteps
          ? PreferredSize(
              preferredSize: Size.fromHeight(34.0),
              child: LinearPercentIndicator(
                lineHeight: 8.0,
                barRadius: const Radius.circular(10),
                percent: percent,
                backgroundColor: Colors.grey[300],
                progressColor: Colors.blue,
              ),
            )
          : null,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) leading!,
          if (title != null) title!,
        ],
      ),
    );
  }

  @override
  Size get preferredSize {
    if (showSteps) {
      return Size.fromHeight(height + 16);
    } else {
      return Size.fromHeight(height);
    }
  }
}
