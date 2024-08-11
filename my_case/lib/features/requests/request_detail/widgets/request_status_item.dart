import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';

class LevelListItem extends ConsumerWidget {
  final String title;
  final String step;
  final bool isCompleted;
  const LevelListItem({
    super.key,
    this.showLine = true,
    required this.title,
    required this.step,
    this.isCompleted = false,
  });

  final bool showLine;

  get percent {
    return 1.0;
  }

  get progressColor => CColors.primaryColor;

  Color get progressBackgroundColor {
    return CColors.primaryColor;
  }

  Color get stepColor {
    return CColors.white;
  }

  get opacity {
    if (isCompleted) {
      return 1.0;
    } else {
      return 0.5;
    }
  }

  get icon {
    return Icons.check;
  }

  get lineColor {
    return CColors.primaryColor;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: opacity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 90,
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: width * 0.20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: progressBackgroundColor,
                        child: isCompleted
                            ? Icon(
                                icon,
                                color: stepColor,
                              )
                            : SizedBox(),
                      ),
                      if (showLine)
                        Expanded(
                          child: Container(
                            width: 5,
                            decoration: BoxDecoration(
                              color: lineColor,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          title,
                          style: context.text20Bold,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
