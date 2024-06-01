import 'package:flutter/material.dart';

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CAppBar({
    super.key,
    this.title = "",
    this.height = 50,
    this.backgroundColor = Colors.transparent,
    this.elevation = 0,
    this.leadingColor = Colors.black,
  });

  final String title;
  final double height;
  final Color? backgroundColor;
  final double elevation;
  final Color? leadingColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      automaticallyImplyLeading: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
