import 'package:cinemahub/core/dependency_injection/di.dart';
import 'package:cinemahub/core/enums/usecase_status.dart';
import 'package:cinemahub/features/home/presentation/cubit/home_cubit.dart';
import 'package:cinemahub/features/movies/presentation/logic/trending_movies_cubit.dart';
import 'package:cinemahub/features/movies/presentation/logic/trending_movies_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/horizontal_list_view.dart';
import '../../../movies/domain/entities/movie.dart';
import '../../../movies/presentation/widgets/movie_list_widget.dart';
import '../../../theme/presentation/widgets/theme_icon_button.dart';
import '../../../tv_show/domain/entities/tv_show.dart';
import '../../../tv_show/presentation/cubit/trending_tv_shows_cubit.dart';
import '../../../tv_show/presentation/cubit/trending_tv_shows_state.dart';
import '../../../tv_show/presentation/widgets/tv_show_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => DependencyInjector.instance.sl<TrendingMoviesCubit>()),
        BlocProvider(create: (context) => DependencyInjector.instance.sl<TrendingTVShowsCubit>()),
      ],
      child: const HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  void _loadData() {
    context.read<TrendingMoviesCubit>().fetchTrendingMovies();
    context.read<TrendingTVShowsCubit>().fetchTrendingTVShows();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CinemaHub'), actions: [const ThemeIconButton()]),
      body: SingleChildScrollView(
        key: const Key('homeScrollView'),
        padding: EdgeInsets.only(bottom: 50.h),
        child: Column(
          children: [
            HorizontalListView<TrendingMoviesCubit, TrendingMoviesState, Movie>(
              sectionTitle: 'Trending Movies',
              mapState: (state) => state.when(
                initial: () => (status: UsecaseStatus.initial, error: null, items: const []),
                loading: () => (status: UsecaseStatus.loading, error: null, items: const []),
                success: (movies) => (status: UsecaseStatus.success, error: null, items: movies),
                error: (error) => (status: UsecaseStatus.failure, error: error, items: const []),
              ),
              itemBuilder: (item) => MovieListWidget(item),
              skeleton: const MovieListWidget.skeleton(),
            ),

            HorizontalListView<TrendingTVShowsCubit, TrendingTVShowsState, TVShow>(
              sectionTitle: 'Trending TV Shows',
              mapState: (state) => state.when(
                initial: () => (status: UsecaseStatus.initial, error: null, items: const []),
                loading: () => (status: UsecaseStatus.loading, error: null, items: const []),
                success: (tvShows) => (status: UsecaseStatus.success, error: null, items: tvShows),
                error: (error) => (status: UsecaseStatus.failure, error: error, items: const []),
              ),
              itemBuilder: (item) => TVShowListWidget(item),
              skeleton: TVShowListWidget.skeleton(),
            ),
          ],
        ),
      ),
    );
  }
}
