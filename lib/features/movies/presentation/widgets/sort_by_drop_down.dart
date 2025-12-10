import 'package:cinemahub/core/widgets/app_drop_down.dart';
import 'package:cinemahub/features/genre/presentation/cubit/genre_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/enums/sort_by.dart';
import '../logic/movies_cubit.dart';

class SortByDropDown extends StatelessWidget {
  const SortByDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<GenreCubit, GenreState, SortBy?>(
      selector: (state) => state.selectedSortBy,
      builder: (context, sortBy) {
        return AppDropdown<SortBy>(
          constraints: BoxConstraints(maxWidth: 180.w),
          hintText: 'Sort By',
          maxHeight: 200.h,
          onChanged: (val) {
            if (val == null) return;
            final selectedGenre = context.read<GenreCubit>().state.selectedGenre;
            context.read<GenreCubit>().selectSortBy(val);
            context.read<MoviesCubit>().fetchFilteredMovies(selectedGenre?.id, val.value);
          },
          items: SortBy.values,
          itemMapper: (e) => DropdownMenuItem<SortBy>(value: e, child: Text(e.displayName)),
        );
      },
    );
  }
}
