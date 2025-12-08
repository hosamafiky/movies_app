import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/enums/usecase_status.dart';
import 'package:movies_app/core/extensions/context.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/presentation/logic/movies_cubit.dart';
import 'package:movies_app/movies/presentation/pages/movie_details_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/networking/interface/error_response.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({super.key, required this.dataSelector});

  final ({UsecaseStatus status, ErrorResponse? error, List<Movie> movies}) Function(MoviesState) dataSelector;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MoviesCubit, MoviesState, ({UsecaseStatus status, ErrorResponse? error, List<Movie> movies})>(
      selector: dataSelector,
      builder: (context, state) {
        return FadeIn(
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            height: 170,
            child: switch (state.status) {
              UsecaseStatus.initial => const Center(child: CircularProgressIndicator.adaptive()),
              UsecaseStatus.loading => const Center(child: CircularProgressIndicator.adaptive()),
              UsecaseStatus.failure => Center(child: Text('Error: ${state.error?.message ?? "Unknown error"}')),
              UsecaseStatus.success => ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () => context.to(MovieDetailScreen(movie)),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: movie.fullBackdropPath(),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8.0)),
                            ),
                          ),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            },
          ),
        );
      },
    );
  }
}
