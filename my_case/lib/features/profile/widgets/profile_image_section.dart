import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:my_case/features/profile/profile_notifier.dart';
import 'package:my_case/features/profile/profile_ui_model.dart';
import 'package:my_case/features/profile/widgets/profile_image_widget.dart';

class ProfileImageSectionWidget extends ConsumerWidget {
  const ProfileImageSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProfileUIModel? profileUIModel;
    final profileProvider = ref.watch(profileNotifierProvider);

    profileProvider.when(
      data: (data) {
        profileUIModel = data;
      },
      loading: () {},
      error: (error, stackTrace) {},
    );

    return Row(
      children: [
        ProfileImageWidget(),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${profileUIModel?.profileModel?.name ?? ""} ${profileUIModel?.profileModel?.surname ?? ""}",
              style: context.text20Bold,
            ),
            Text(
              profileUIModel?.profileModel?.countryOfAsylum ?? "",
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
