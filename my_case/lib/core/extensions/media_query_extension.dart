import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get pixelRatio => MediaQuery.of(this).devicePixelRatio;
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;
}
