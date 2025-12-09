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
}
