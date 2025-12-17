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
  Color get bottomNavigationUnselected => const Color(0xFF8FBDCC);

  @override
  Color get inputFieldFill => const Color(0xFF21404A);
  @override
  Color get inputFieldHintText => const Color(0xFF8FBDCC);

  @override
  Color get chipBackground => const Color(0xFF21404A);
  @override
  Color get chipLabel => ColorPalette.whiteColor;

  @override
  Color get shimmerBase => chipBackground;
  @override
  Color get shimmerHighlight => const Color(0xFF2A5260);

  @override
  Color get progressIndicator => const Color(0xFF26BFF5);
  @override
  Color get progressIndicatorBG => const Color(0xFF305969);
}
