import 'package:cinemahub/core/dependency_injection/di.dart';
import 'package:cinemahub/features/home/presentation/cubit/home_cubit.dart';
import 'package:cinemahub/features/movies/presentation/logic/movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/horizontal_list_view.dart';
import '../../../movies/domain/entities/movie.dart';
import '../../../movies/presentation/widgets/movie_list_widget.dart';
import '../../../theme/presentation/widgets/theme_icon_button.dart';
import '../../../tv_show/domain/entities/tv_show.dart';
import '../../../tv_show/presentation/cubit/tv_show_cubit.dart';
import '../../../tv_show/presentation/widgets/tv_show_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => DependencyInjector.instance.sl<MoviesCubit>()),
        BlocProvider(create: (context) => DependencyInjector.instance.sl<TVShowCubit>()),
      ],
      child: HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    context.read<MoviesCubit>().fetchTrendingMovies();
    context.read<TVShowCubit>().fetchTrendingTVShows();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CinemaHub'), actions: [ThemeIconButton()]),
      body: SingleChildScrollView(
        key: const Key('homeScrollView'),
        padding: EdgeInsets.only(bottom: 50.h),
        child: Column(
          children: [
            HorizontalListView<MoviesCubit, MoviesState, Movie>(
              sectionTitle: 'Trending Movies',
              dataSelector: (state) => (status: state.trendingStatus, error: state.trendingError, items: state.trendingMovies),
              itemBuilder: (item) => MovieListWidget(item),
            ),

            HorizontalListView<TVShowCubit, TVShowState, TVShow>(
              sectionTitle: 'Trending TV Shows',
              dataSelector: (state) => (status: state.trendingStatus, error: state.trendingError, items: state.trendingTVShows),
              itemBuilder: (item) => TVShowListWidget(item),
            ),
          ],
        ),
      ),
    );
  }
}
