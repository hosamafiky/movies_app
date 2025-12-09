import 'package:cinemahub/core/theme/colors/color_palette.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/colors/dark_color_palette.dart';
import '../../../../core/theme/colors/light_color_palette.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({bool isDarkMode = false})
    : super(ThemeState(palette: isDarkMode ? DarkColorPalette() : LightColorPalette(), mode: isDarkMode ? ThemeMode.dark : ThemeMode.light));

  void toggleTheme() {
    final isDarkMode = state.palette is DarkColorPalette;
    final newPalette = isDarkMode ? LightColorPalette() : DarkColorPalette();
    final newMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    emit(state.copyWith(palette: newPalette, mode: newMode));
  }
}
