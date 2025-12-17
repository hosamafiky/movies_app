import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/interface/error_response.dart';
import '../../domain/entities/movie.dart';

part 'trending_movies_state.freezed.dart';

@freezed
class TrendingMoviesState with _$TrendingMoviesState {
  const factory TrendingMoviesState.initial() = _Initial;
  const factory TrendingMoviesState.loading() = _Loading;
  const factory TrendingMoviesState.success(List<Movie> movies) = _Success;
  const factory TrendingMoviesState.error(ErrorResponse error) = _Error;
}
