import 'package:flutter/material.dart';

class CListTile extends StatelessWidget {
  final String? title;
  final String? subtitle;
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
      title: title != null ? Text(title!) : null,
      subtitle: subtitle != null ? Text(subtitle!) : null,
      leading: leading,
      trailing: trailing,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: Colors.grey.shade300,
          width: 2,
        ),
      ),
    );
  }
}
