import 'package:cinemahub/core/widgets/grid_view.dart';
import 'package:cinemahub/features/movies/domain/usecases/get_movies_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/dependency_injection/di.dart';
import '../../../filter/presentation/cubit/filter_cubit.dart';
import '../../../filter/presentation/widgets/genre_dropdown_menu_widget.dart';
import '../../../filter/presentation/widgets/sort_by_icon_button.dart';
import '../../../filter/presentation/widgets/year_filter_dropdown.dart';
import '../../domain/entities/movie.dart';
import '../logic/filtered_movies_cubit.dart';
import '../logic/popular_movies_cubit.dart';
import '../widgets/movie_grid_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DependencyInjector.instance.sl<PopularMoviesCubit>()..fetchPopularMovies()),
        BlocProvider(create: (context) => DependencyInjector.instance.sl<FilteredMoviesCubit>()),
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
    context.read<FilterCubit>().fetchGendres();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies'), actions: [SortByIconButton()]),
      body: NestedScrollView(
        headerSliverBuilder: (context, isInnerBoxScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Wrap(spacing: 16.w, runSpacing: 16.h, alignment: WrapAlignment.start, children: [GenreDropdownMenuWidget(), YearFilterDropdown()]),
              ),
            ),
          ];
        },
        body: BlocSelector<FilterCubit, FilterState, GetMoviesFilters>(
          selector: (state) => state.filters,
          builder: (context, filters) {
            if (!filters.hasFilters) {
              return CustomGridView<PopularMoviesCubit, PopularMoviesState, Movie>(
                dataSelector: (state) => (status: state.status, error: state.error, items: state.movies),
                itemBuilder: (movie) => MovieGridWidget(movie),
                skeleton: MovieGridWidget.skeleton(),
              );
            }
            return CustomGridView<FilteredMoviesCubit, FilteredMoviesState, Movie>(
              dataSelector: (state) => (status: state.status, error: state.error, items: state.movies),
              itemBuilder: (movie) => MovieGridWidget(movie),
              skeleton: MovieGridWidget.skeleton(),
            );
          },
        ),
      ),
    );
  }
}
