import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/interface/error_response.dart';
import '../../domain/entities/movie.dart';

part 'filtered_movies_state.freezed.dart';

@freezed
class FilteredMoviesState with _$FilteredMoviesState {
  const factory FilteredMoviesState.initial() = _Initial;
  const factory FilteredMoviesState.loading() = _Loading;
  const factory FilteredMoviesState.success(List<Movie> movies) = _Success;
  const factory FilteredMoviesState.error(ErrorResponse error) = _Error;
}
