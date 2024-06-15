import 'package:flutter/material.dart';

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Color? backgroundColor;
  final double elevation;
  final Color? leadingColor;
  final Widget? title;
  final Widget? leading;

  const CAppBar({
    super.key,
    this.height = 60,
    this.backgroundColor = Colors.transparent,
    this.elevation = 0,
    this.leadingColor = Colors.black,
    this.title,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      automaticallyImplyLeading: true,
      centerTitle: true,
      scrolledUnderElevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title ?? Container(),
          Spacer(),
          leading ?? Container(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
