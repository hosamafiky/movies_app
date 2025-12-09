import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/light_color_palette.dart';
import '../styles/text_styles.dart';

ThemeData get lightThemeData {
  final colors = LightColorPalette();
  final styles = TextStyles(colors);
  return ThemeData(
    fontFamily: 'SplineSans',
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: colors.scaffoldBGColor,
    appBarTheme: AppBarThemeData(toolbarHeight: 72.h, backgroundColor: colors.scaffoldBGColor, elevation: 0, titleTextStyle: styles.appBarTitleStyle),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: colors.bottomNavigationBackground,
      selectedItemColor: colors.bottomNavigationSelected,
      unselectedItemColor: colors.bottomNavigationUnselected,
      selectedLabelStyle: styles.bottomNavigationSelectedLabelStyle,
      unselectedLabelStyle: styles.bottomNavigationUnselectedLabelStyle,
    ),
    // Add other theme properties as needed
  );
}
