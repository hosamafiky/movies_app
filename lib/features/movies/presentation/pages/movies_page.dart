import 'package:cinemahub/core/widgets/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/dependency_injection/di.dart';
import '../../../../core/enums/sort_by.dart';
import '../../../genre/domain/entities/genre.dart';
import '../../../genre/presentation/cubit/genre_cubit.dart';
import '../../../genre/presentation/widgets/genre_dropdown_menu_widget.dart';
import '../../domain/entities/movie.dart';
import '../logic/movies_cubit.dart';
import '../widgets/movie_grid_widget.dart';
import '../widgets/sort_by_drop_down.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DependencyInjector.instance.sl<MoviesCubit>()..fetchPopularMovies()),
        BlocProvider(create: (context) => DependencyInjector.instance.sl<GenreCubit>()),
      ],
      child: MoviesPageBody(),
    );
  }
}

class MoviesPageBody extends StatefulWidget {
  const MoviesPageBody({super.key});

  @override
  State<MoviesPageBody> createState() => _MoviesPageBodyState();
}

class _MoviesPageBodyState extends State<MoviesPageBody> {
  @override
  void initState() {
    context.read<GenreCubit>().fetchGendres();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies')),
      body: NestedScrollView(
        headerSliverBuilder: (context, isInnerBoxScrolled) {
          return [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              sliver: SliverToBoxAdapter(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [GenreDropdownMenuWidget(), SortByDropDown()]),
              ),
            ),
          ];
        },
        body: BlocSelector<GenreCubit, GenreState, ({Genre? selectedGenre, SortBy? selectedSortBy})>(
          selector: (state) => (selectedGenre: state.selectedGenre, selectedSortBy: state.selectedSortBy),
          builder: (context, data) {
            return CustomGridView<MoviesCubit, MoviesState, Movie>(
              dataSelector: (state) {
                if (data.selectedGenre == null) return (status: state.popularStatus, error: state.popularError, items: state.popularMovies);
                return (status: state.genreStatus, error: state.genreError, items: state.genreMovies);
              },
              itemBuilder: (movie) => MovieGridWidget(movie),
            );
          },
        ),
      ),
    );
  }
}
