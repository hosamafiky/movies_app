import 'package:cinemahub/features/filter/presentation/cubit/filter_cubit.dart';
import 'package:cinemahub/features/movies/presentation/logic/filtered_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/app_drop_down.dart';
import '../../domain/entities/genre.dart';

class GenreDropdownMenuWidget extends StatelessWidget {
  const GenreDropdownMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FilterCubit, FilterState, List<Genre>>(
      selector: (state) => state.genres,
      builder: (context, genres) {
        return AppDropdown<Genre>(
          value: context.read<FilterCubit>().state.filters.genre,
          onChanged: (Genre? genre) {
            if (genre == null) return;
            context.read<FilterCubit>().selectGenre(genre);
            final filters = context.read<FilterCubit>().state.filters;
            context.read<FilteredMoviesCubit>().fetchFilteredMovies(filters);
          },
          constraints: BoxConstraints(maxWidth: 180.w),
          maxHeight: 200.h,
          items: genres,
          hintText: 'Genres',
          itemMapper: (genre) => DropdownMenuItem<Genre>(value: genre, child: Text(genre.name)),
        );
      },
    );
  }
}
