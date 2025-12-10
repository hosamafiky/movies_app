import 'package:cinemahub/core/theme/colors/color_palette.dart';
import 'package:cinemahub/core/theme/styles/app_font_weights.dart';
import 'package:cinemahub/core/theme/styles/text_styles.dart';
import 'package:cinemahub/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropdown<T> extends StatelessWidget {
  const AppDropdown({
    super.key,
    this.suffixIconColor,
    this.validator,
    required this.onChanged,
    required this.items,
    required this.itemMapper,
    this.label,
    this.style,
    this.value,
    this.fillColor,
    this.itemAsString,
    this.hintText,
    this.maxHeight,
    this.constraints,
  });

  /// Built-in dropdown
  final List<T> items;
  final DropdownMenuItem<T> Function(T) itemMapper;

  final Color? fillColor;
  final T? value;
  final String? label;
  final TextStyle? style;
  final String? hintText;
  final Color? suffixIconColor;
  final double? maxHeight;
  final BoxConstraints? constraints;
  final String? Function(T?)? validator;
  final String Function(T)? itemAsString;
  final Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<ThemeCubit>().state.palette;
    final styles = TextStyles(palette);
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<T>(
        validator: validator,
        initialValue: value,
        onChanged: onChanged,
        isDense: true,
        borderRadius: BorderRadius.circular(16.r),
        iconEnabledColor: ColorPalette.whiteColor,
        items: items.map(itemMapper).toList(),
        style: style ?? styles.inputFieldHintTextStyle.copyWith(color: palette.bottomNavigationSelected, fontWeight: AppFontWeight.medium),
        menuMaxHeight: maxHeight,
        icon: Icon(Icons.keyboard_arrow_down_rounded, color: suffixIconColor ?? palette.bottomNavigationSelected),
        decoration: InputDecoration(hintMaxLines: 1, filled: true, hintText: hintText, fillColor: fillColor, constraints: constraints),
      ),
    );
  }
}
