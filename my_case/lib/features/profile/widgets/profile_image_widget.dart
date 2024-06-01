import 'package:flutter/material.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';

class ProfileImageWidget extends StatelessWidget {
  final double radius;
  const ProfileImageWidget({
    super.key,
    this.radius = 42,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + 2,
      backgroundColor: CColors.primaryColor,
      child: CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage("https://thispersondoesnotexist.com/"),
      ),
    );
  }
}
