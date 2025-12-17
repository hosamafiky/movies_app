import 'package:cinemahub/core/base/base_usecase.dart';
import 'package:cinemahub/core/enums/sort_by.dart';
import 'package:cinemahub/features/filter/domain/entities/genre.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie.dart';
import '../repository/movie_repository.dart';

class GetMoviesUsecase extends BaseUsecase<List<Movie>, GetMoviesParams> {
  final MovieRepository repository;

  GetMoviesUsecase({required this.repository});

  @override
  Future<Either<Failure, List<Movie>>> call(GetMoviesParams params) async {
    return await repository.getMovies(params.path, queryParameters: params.filters?.toMap());
  }
}

class GetMoviesParams extends Equatable {
  final String path;
  final GetMoviesFilters? filters;

  const GetMoviesParams({required this.path, this.filters});

  @override
  List<Object?> get props => [path, filters];
}

class GetMoviesFilters extends Equatable {
  final Genre? genre;
  final SortBy? sortBy;
  final int? year;

  const GetMoviesFilters({this.genre, this.sortBy, this.year});

  bool get hasFilters => genre != null || sortBy != null || year != null;

  Map<String, dynamic> toMap() =>
      {'with_genres': genre?.id, 'sort_by': sortBy?.value, 'primary_release_year': year}..removeWhere((key, value) => value == null);

  GetMoviesFilters copyWith({Genre? genre, SortBy? sortBy, int? year}) {
    return GetMoviesFilters(genre: genre ?? this.genre, sortBy: sortBy ?? this.sortBy, year: year ?? this.year);
  }

  @override
  List<Object?> get props => [genre, sortBy, year];
}
