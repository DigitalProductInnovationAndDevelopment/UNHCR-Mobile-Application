import 'package:flutter/material.dart';
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
    this.backgroundColor = Colors.transparent,
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
                lineHeight: 14.0,
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

  Widget _defaultLeading(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;

    return canPop
        ? IconButton(
            icon: Icon(Icons.arrow_back, color: leadingColor),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        : Container();
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
