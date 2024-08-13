import 'package:flutter/material.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';

class NotificationWidget extends StatelessWidget {
  final Function()? onClick;
  final Function()? cancelFunc;
  final String? title;
  final String? description;
  const NotificationWidget({
    super.key,
    this.onClick,
    this.cancelFunc,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: CColors.primaryColor,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10.0,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? "",
              style: context.text16Bold.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8.0),
            Text(
              description ?? "",
              style: context.text14.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
