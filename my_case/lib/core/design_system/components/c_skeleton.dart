import 'package:flutter/material.dart';

class CSkeleton extends StatelessWidget {
  final double? height, width;
  const CSkeleton({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(16 / 2),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
