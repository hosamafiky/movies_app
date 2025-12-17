import 'package:flutter/material.dart';

import 'color_palette.dart';

class LightColorPalette implements ColorPalette {
  @override
  Color get scaffoldBGColor => const Color(0xFFF7FAFC);

  @override
  Color get appBarTitle => const Color(0xFF0D171C);

  @override
  Color get bottomNavigationBackground => scaffoldBGColor;
  @override
  Color get bottomNavigationSelected => const Color(0xFF0D171C);
  @override
  Color get bottomNavigationUnselected => const Color(0xFF4A879C);

  @override
  Color get inputFieldFill => const Color(0xFFE8F0F5);
  @override
  Color get inputFieldHintText => const Color(0xFF4A879C);

  @override
  Color get chipBackground => const Color(0xFFE8F0F5);
  @override
  Color get chipLabel => const Color(0xFF0D171C);

  @override
  Color get shimmerBase => Colors.grey.shade300;
  @override
  Color get shimmerHighlight => Colors.grey.shade100;

  @override
  Color get progressIndicator => const Color(0xFF26BFF5);
  @override
  Color get progressIndicatorBG => const Color(0xFFCFE3E8);
}
