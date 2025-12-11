import 'package:cinemahub/features/filter/presentation/cubit/filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_constants.dart';
import '../../../../core/enums/sort_by.dart';
import '../../../movies/presentation/logic/filtered_movies_cubit.dart';

class SortByIconButton extends StatelessWidget {
  const SortByIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FilterCubit, FilterState, SortBy?>(
      selector: (state) => state.filters.sortBy,
      builder: (context, sortBy) {
        return PopupMenuButton(
          initialValue: sortBy,
          icon: Icon(Icons.sort_outlined),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.radius)),
          offset: Offset(0, 50.h),
          constraints: BoxConstraints(maxHeight: 200.h),
          itemBuilder: (context) => SortBy.values.map((e) => PopupMenuItem(value: e, child: Text(e.displayName))).toList(),
          onSelected: (value) {
            context.read<FilterCubit>().selectSortBy(value);
            final filters = context.read<FilterCubit>().state.filters;
            context.read<FilteredMoviesCubit>().fetchFilteredMovies(filters);
          },
        );
      },
    );
  }
}
