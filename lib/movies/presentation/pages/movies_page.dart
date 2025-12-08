import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/dependency_injection/di.dart';
import 'package:movies_app/movies/presentation/logic/movies_cubit.dart';
import 'package:movies_app/movies/presentation/widgets/horizontal_list_view.dart';

import '../widgets/now_playing_section.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DependencyInjector.instance.sl<MoviesCubit>()
        ..fetchNowPlayingMovies()
        ..fetchPopularMovies()
        ..fetchTopRatedMovies(),
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NowPlayingSection(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Popular", style: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15)),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO POPULAR SCREEN
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: const [Text('See More'), Icon(Icons.arrow_forward_ios, size: 16.0)]),
                      ),
                    ),
                  ],
                ),
              ),
              HorizontalListView(dataSelector: (MoviesState state) => (status: state.popularStatus, error: state.popularError, movies: state.popularMovies)),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Top Rated", style: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15)),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: const [Text('See More'), Icon(Icons.arrow_forward_ios, size: 16.0)]),
                      ),
                    ),
                  ],
                ),
              ),
              HorizontalListView(dataSelector: (MoviesState state) => (status: state.topRatedStatus, error: state.topRatedError, movies: state.topRatedMovies)),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
