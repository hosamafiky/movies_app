import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/interface/error_response.dart';
import '../../domain/entities/movie.dart';

part 'now_playing_movies_state.freezed.dart';

@freezed
class NowPlayingMoviesState with _$NowPlayingMoviesState {
  const factory NowPlayingMoviesState.initial() = _Initial;
  const factory NowPlayingMoviesState.loading() = _Loading;
  const factory NowPlayingMoviesState.success(List<Movie> movies) = _Success;
  const factory NowPlayingMoviesState.error(ErrorResponse error) = _Error;
}
