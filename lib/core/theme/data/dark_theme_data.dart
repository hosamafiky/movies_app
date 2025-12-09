import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/dark_color_palette.dart';
import '../styles/text_styles.dart';

ThemeData get darkThemeData {
  final colors = DarkColorPalette();
  final styles = TextStyles(colors);
  return ThemeData(
    fontFamily: 'SplineSans',
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: colors.scaffoldBGColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colors.inputFieldFillColor,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide.none),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    ),
    appBarTheme: AppBarThemeData(
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 72.h,
      backgroundColor: colors.scaffoldBGColor,
      elevation: 0,
      titleTextStyle: styles.appBarTitleStyle,
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
    // Add other theme properties as needed
  );
}
