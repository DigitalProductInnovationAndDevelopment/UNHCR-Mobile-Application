import 'package:flutter/material.dart';

enum LogoType { withText, withoutText }

class CLogo extends StatelessWidget {
  final double? size;
  final String? heroTag;
  final LogoType logoType;
  const CLogo({
    super.key,
    this.size,
    this.heroTag,
    this.logoType = LogoType.withText,
  });

  get logoPath {
    switch (logoType) {
      case LogoType.withText:
        return "assets/images/unhcr_logo_with_text.png";
      case LogoType.withoutText:
        return "assets/images/unhcr_logo.png";
    }
  }

  get logoSize {
    if (size != null) return size;

    switch (logoType) {
      case LogoType.withText:
        return 300.0;
      case LogoType.withoutText:
        return 70.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (heroTag != null) {
      return Hero(
        tag: heroTag!,
        child: Image.asset(
          logoPath,
          width: logoSize,
        ),
      );
    }

    return Image.asset(
      logoPath,
      width: size,
    );
  }
}
