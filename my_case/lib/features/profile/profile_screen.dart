import 'package:flutter/material.dart';
import 'package:my_case/features/profile/widgets/profile_edit_section_widget.dart';
import 'package:my_case/features/profile/widgets/profile_image_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ProfileImageSectionWidget(),
        ),
        ProfileEditSectionWidget(),
      ],
    );
  }
}
