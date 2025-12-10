import 'package:cinemahub/core/theme/colors/color_palette.dart';
import 'package:cinemahub/core/theme/styles/text_styles.dart';
import 'package:cinemahub/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension NavigationExtension on BuildContext {
  Future<T?> to<T>(Widget page) async {
    return await Navigator.push<T>(this, MaterialPageRoute(builder: (_) => page));
  }

  Future<T?> toNamed<T>(String routeName, {Object? arguments}) async {
    return await Navigator.pushNamed<T>(this, routeName, arguments: arguments);
  }

  void back<T extends Object?>([T? result]) {
    Navigator.pop<T>(this, result);
  }
}

extension ThemeRelatedExtension on BuildContext {
  // Get the current color palette from ThemeCubit
  ColorPalette get readPalette => read<ThemeCubit>().state.palette;
  TextStyles get readTextStyles => TextStyles(readPalette);

  // Watch the current color palette from ThemeCubit
  ColorPalette get watchPalette => watch<ThemeCubit>().state.palette;
  TextStyles get watchTextStyles => TextStyles(watchPalette);
}
