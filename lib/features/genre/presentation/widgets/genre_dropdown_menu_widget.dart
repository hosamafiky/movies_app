import 'package:cinemahub/features/genre/presentation/cubit/genre_cubit.dart';
import 'package:cinemahub/features/movies/presentation/logic/movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/app_drop_down.dart';
import '../../domain/entities/genre.dart';

class GenreDropdownMenuWidget extends StatelessWidget {
  const GenreDropdownMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<GenreCubit, GenreState, List<Genre>>(
      selector: (state) => state.genres,
      builder: (context, genres) {
        return AppDropdown<Genre>(
          onChanged: (Genre? genre) {
            if (genre == null) return;
            context.read<MoviesCubit>().fetchMoviesByGenre(genre.id);
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
