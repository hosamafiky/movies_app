import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/interface/error_response.dart';
import '../../domain/entities/movie.dart';

part 'popular_movies_state.freezed.dart';

@freezed
class PopularMoviesState with _$PopularMoviesState {
  const factory PopularMoviesState.initial() = _Initial;
  const factory PopularMoviesState.loading() = _Loading;
  const factory PopularMoviesState.success(List<Movie> movies) = _Success;
  const factory PopularMoviesState.error(ErrorResponse error) = _Error;
}
