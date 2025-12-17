import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/usecase_status.dart';
import '../../../../core/networking/interface/error_response.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/trailer.dart';

part 'movie_details_state.freezed.dart';

@freezed
abstract class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState({
    @Default(UsecaseStatus.initial) UsecaseStatus movieDetailsStatus,
    ErrorResponse? movieDetailsError,
    MovieDetails? movieDetails,
    @Default(UsecaseStatus.initial) UsecaseStatus trailersStatus,
    ErrorResponse? trailersError,
    @Default([]) List<Trailer> trailers,
    @Default(UsecaseStatus.initial) UsecaseStatus similarStatus,
    ErrorResponse? similarError,
    @Default([]) List<Movie> similarMovies,
    @Default(UsecaseStatus.initial) UsecaseStatus recommendationsStatus,
    ErrorResponse? recommendationsError,
    @Default([]) List<Movie> recommendationsMovies,
  }) = _MovieDetailsState;
}
