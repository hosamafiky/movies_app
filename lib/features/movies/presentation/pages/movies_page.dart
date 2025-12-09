import 'package:cinemahub/core/widgets/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/dependency_injection/di.dart';
import '../../../genre/presentation/cubit/genre_cubit.dart';
import '../../../genre/presentation/widgets/genre_dropdown_menu_widget.dart';
import '../../domain/entities/movie.dart';
import '../logic/movies_cubit.dart';
import '../widgets/movie_grid_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DependencyInjector.instance.sl<MoviesCubit>()),
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
              sliver: SliverToBoxAdapter(child: Row(children: [GenreDropdownMenuWidget()])),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          ];
        },
        body: CustomGridView<MoviesCubit, MoviesState, Movie>(
          dataSelector: (state) => (status: state.genreStatus, error: state.genreError, items: state.genreMovies),
          itemBuilder: (movie) => MovieGridWidget(movie),
        ),
      ),
    );
  }
}
