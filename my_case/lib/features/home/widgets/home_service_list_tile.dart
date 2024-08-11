import 'package:flutter/material.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';

class HomeServiceListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;
  const HomeServiceListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        tileColor: Colors.grey[300],
        leading: Icon(
          icon,
        ),
        title: Text(
          title,
          style: context.text16Bold,
        ),
        subtitle: Text(
          subtitle,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
      ),
    );
  }
}
