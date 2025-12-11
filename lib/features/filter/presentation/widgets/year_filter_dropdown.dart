import 'package:cinemahub/core/widgets/app_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../movies/presentation/logic/filtered_movies_cubit.dart';
import '../cubit/filter_cubit.dart';

class YearFilterDropdown extends StatelessWidget {
  const YearFilterDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDropdown<int>(
      items: List.generate(DateTime.now().year - 1900 + 1, (index) => DateTime.now().year - index),
      constraints: BoxConstraints(maxWidth: 100.w),
      hintText: 'Year',
      maxHeight: 180.h,
      onChanged: (value) {
        if (value == null) return;
        context.read<FilterCubit>().selectYear(value);
        final filters = context.read<FilterCubit>().state.filters;
        context.read<FilteredMoviesCubit>().fetchFilteredMovies(filters.copyWith(year: value));
      },
      itemMapper: (item) => DropdownMenuItem(value: item, child: Text('$item')),
    );
  }
}
