import 'package:cinemahub/core/extensions/assets.dart';
import 'package:cinemahub/core/resources/app_assets.dart';
import 'package:cinemahub/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeIconButton extends StatelessWidget {
  const ThemeIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ThemeCubit, ThemeState, ThemeMode>(
      selector: (state) => state.mode,
      builder: (context, state) {
        return IconButton(
          onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          icon: (state == ThemeMode.dark ? Assets.assetsIconsSvgMoon : Assets.assetsIconsSvgSun).svg(),
        );
      },
    );
  }
}
