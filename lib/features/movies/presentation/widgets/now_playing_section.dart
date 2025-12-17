import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinemahub/core/widgets/app_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/now_playing_movies_cubit.dart';
import '../logic/now_playing_movies_state.dart';

class NowPlayingSection extends StatelessWidget {
  const NowPlayingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMoviesCubit, NowPlayingMoviesState>(
      builder: (context, state) {
        final hasError = state.maybeWhen(error: (error) => true, orElse: () => false);
        final failure = state.maybeWhen(error: (error) => error, orElse: () => null);
        if (hasError) {
          return SizedBox(height: 400.0, child: Center(child: Text('Error: ${failure!.message}')));
        }
        final movies = state.maybeWhen(orElse: () => const [], success: (movies) => movies);
        return FadeIn(
          duration: const Duration(milliseconds: 500),
          child: CarouselSlider(
            options: CarouselOptions(height: 500.0, viewportFraction: 1.0, onPageChanged: (index, reason) {}),
            items: movies.map((item) {
              return GestureDetector(
                key: const Key('openMovieMinimalDetail'),
                onTap: () {},
                child: Stack(
                  children: [
                    ShaderMask(
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            // fromLTRB
                            Colors.transparent,
                            Colors.black,
                            Colors.black,
                            Colors.transparent,
                          ],
                          stops: [0, 0.3, 0.5, 1],
                        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.dstIn,
                      child: AppCachedNetworkImage(height: 560.0, imageUrl: item.fullBackdropPath, fit: BoxFit.cover),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.circle, color: Colors.redAccent, size: 16.0),
                                const SizedBox(width: 4.0),
                                Text('Now Playing'.toUpperCase(), style: const TextStyle(fontSize: 16.0)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text(item.title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 24)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
