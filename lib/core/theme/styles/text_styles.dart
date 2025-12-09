import 'package:cinemahub/core/theme/colors/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_font_weights.dart';

class TextStyles {
  final ColorPalette palette;
  const TextStyles(this.palette);

  /// APP BAR
  TextStyle get appBarTitleStyle => TextStyle(color: palette.appBarTitle, fontSize: 18.sp, fontWeight: AppFontWeight.bold, height: 23 / 18);

  /// HEADINGS
  TextStyle get heading1Style => TextStyle(fontSize: 22.sp, fontWeight: AppFontWeight.bold, height: 28 / 22);

  /// TITLES
  TextStyle get title1Style => TextStyle(fontSize: 16.sp, fontWeight: AppFontWeight.medium, height: 24 / 16);

  /// BOTTOM NAVIGATION BAR
  TextStyle get bottomNavigationSelectedLabelStyle =>
      TextStyle(color: palette.bottomNavigationSelected, fontSize: 12.sp, fontWeight: AppFontWeight.medium, height: 18 / 12);
  TextStyle get bottomNavigationUnselectedLabelStyle =>
      TextStyle(color: palette.bottomNavigationUnselected, fontSize: 12.sp, fontWeight: AppFontWeight.medium, height: 18 / 12);

  /// INPUT FIELDS
  TextStyle get inputFieldHintTextStyle =>
      TextStyle(fontSize: 16.sp, fontWeight: AppFontWeight.regular, height: 24 / 16, color: palette.inputFieldHintTextColor);
}
