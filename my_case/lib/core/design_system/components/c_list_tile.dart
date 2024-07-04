import 'package:flutter/material.dart';

class CListTile extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  const CListTile({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      subtitle: subtitle,
      leading: leading,
      trailing: trailing,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
