import 'package:flutter/material.dart';

abstract class ColorPalette {
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;

  Color get scaffoldBGColor;

  /// APP BAR COLORS
  Color get appBarTitle;

  /// Bottom Navigation Bar Colors
  Color get bottomNavigationSelected;
  Color get bottomNavigationUnselected;
  Color get bottomNavigationBackground;

  /// Input Field Colors
  Color get inputFieldFill;
  Color get inputFieldHintText;

  /// Chip Colors
  Color get chipBackground;
  Color get chipLabel;

  /// Shimmer Effect Colors
  Color get shimmerBase;
  Color get shimmerHighlight;

  /// Progress Indicator Colors
  Color get progressIndicator;
  Color get progressIndicatorBG;
}
