import 'package:flutter/material.dart';

import 'color_palette.dart';

class DarkColorPalette implements ColorPalette {
  @override
  Color get scaffoldBGColor => const Color(0xFF0F1F24);

  @override
  Color get appBarTitle => ColorPalette.whiteColor;

  @override
  Color get bottomNavigationBackground => scaffoldBGColor;
  @override
  Color get bottomNavigationSelected => ColorPalette.whiteColor;
  @override
  Color get bottomNavigationUnselected => Color(0xFF8FBDCC);

  @override
  Color get inputFieldFillColor => Color(0xFF21404A);
  @override
  Color get inputFieldHintTextColor => Color(0xFF8FBDCC);

  @override
  Color get chipBackgroundColor => Color(0xFF21404A);
  @override
  Color get chipLabelColor => ColorPalette.whiteColor;
}
