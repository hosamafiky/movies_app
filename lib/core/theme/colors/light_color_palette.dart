import 'package:flutter/material.dart';

import 'color_palette.dart';

class LightColorPalette implements ColorPalette {
  @override
  Color get scaffoldBGColor => const Color(0xFFF7FAFC);

  @override
  Color get appBarTitle => Color(0xFF0D171C);

  @override
  Color get bottomNavigationBackground => scaffoldBGColor;
  @override
  Color get bottomNavigationSelected => Color(0xFF0D171C);
  @override
  Color get bottomNavigationUnselected => Color(0xFF4A879C);
}
