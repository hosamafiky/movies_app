import 'package:cinemahub/core/enums/usecase_status.dart';
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
import '../logic/filtered_movies_state.dart';
import '../logic/popular_movies_cubit.dart';
import '../logic/popular_movies_state.dart';
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
      child: const MoviesPageBody(),
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
      appBar: AppBar(title: const Text('Movies'), actions: [const SortByIconButton()]),
      body: NestedScrollView(
        headerSliverBuilder: (context, isInnerBoxScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Wrap(
                  spacing: 16.w,
                  runSpacing: 16.h,
                  alignment: WrapAlignment.start,
                  children: [const GenreDropdownMenuWidget(), const YearFilterDropdown()],
                ),
              ),
            ),
          ];
        },
        body: BlocSelector<FilterCubit, FilterState, GetMoviesFilters>(
          selector: (state) => state.filters,
          builder: (context, filters) {
            if (!filters.hasFilters) {
              return CustomGridView<PopularMoviesCubit, PopularMoviesState, Movie>(
                mapState: (state) => state.when(
                  initial: () => (status: UsecaseStatus.initial, error: null, items: const <Movie>[]),
                  loading: () => (status: UsecaseStatus.loading, error: null, items: const <Movie>[]),
                  success: (movies) => (status: UsecaseStatus.success, error: null, items: movies),
                  error: (error) => (status: UsecaseStatus.failure, error: error, items: const <Movie>[]),
                ),
                itemBuilder: (movie) => MovieGridWidget(movie),
                skeleton: const MovieGridWidget.skeleton(),
              );
            }
            return CustomGridView<FilteredMoviesCubit, FilteredMoviesState, Movie>(
              mapState: (state) => state.when(
                initial: () => (status: UsecaseStatus.initial, error: null, items: const <Movie>[]),
                loading: () => (status: UsecaseStatus.loading, error: null, items: const <Movie>[]),
                success: (movies) => (status: UsecaseStatus.success, error: null, items: movies),
                error: (error) => (status: UsecaseStatus.failure, error: error, items: const <Movie>[]),
              ),
              itemBuilder: (movie) => MovieGridWidget(movie),
              skeleton: const MovieGridWidget.skeleton(),
            );
          },
        ),
      ),
    );
  }
}
