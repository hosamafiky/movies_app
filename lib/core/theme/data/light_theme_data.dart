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
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colors.inputFieldFill,
      hintStyle: styles.inputFieldHintTextStyle,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide.none),
    ),
    menuTheme: MenuThemeData(style: MenuStyle(backgroundColor: WidgetStateProperty.all(colors.scaffoldBGColor))),
    appBarTheme: AppBarThemeData(
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 72.h,
      backgroundColor: colors.scaffoldBGColor,
      elevation: 0,
      titleTextStyle: styles.appBarTitleStyle,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: colors.chipBackground,
      labelStyle: styles.chipLabelStyle,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.5.h),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: colors.bottomNavigationBackground,
      selectedItemColor: colors.bottomNavigationSelected,
      unselectedItemColor: colors.bottomNavigationUnselected,
      selectedLabelStyle: styles.bottomNavigationSelectedLabelStyle,
      unselectedLabelStyle: styles.bottomNavigationUnselectedLabelStyle,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: colors.progressIndicator,
      linearTrackColor: colors.progressIndicatorBG,
      circularTrackColor: colors.progressIndicatorBG,
      borderRadius: BorderRadius.circular(50),
    ),
    // Add other theme properties as needed
  );
}
