import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:my_case/features/profile/widgets/profile_image_widget.dart';

class ProfileImageSectionWidget extends StatelessWidget {
  const ProfileImageSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileImageWidget(),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "John Doe",
              style: context.text20Bold,
            ),
            Text(
              "Derik, SY",
              style: context.text16,
            ),
          ],
        ),
        Spacer(),
        IconButton(
          iconSize: 30,
          icon: const Icon(Icons.settings),
          onPressed: () {
            GoRouter.of(context).push(NavigationEnums.settingsScreen.routeName);
          },
        ),
      ],
    );
  }
}
