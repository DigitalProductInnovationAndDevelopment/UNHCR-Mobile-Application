import 'package:flutter/material.dart';

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
      backgroundColor: Colors.grey[300],
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(
          "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png",
        ),
      ),
    );
  }
}
