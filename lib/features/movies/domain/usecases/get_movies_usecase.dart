import 'package:cinemahub/core/enums/sort_by.dart';
import 'package:cinemahub/features/filter/domain/entities/genre.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie.dart';
import '../repository/movie_repository.dart';

class GetMoviesUsecase {
  final MovieRepository repository;

  const GetMoviesUsecase({required this.repository});

  Future<Either<Failure, List<Movie>>> call(String path, {GetMoviesFilters? filters}) async {
    return await repository.getMovies(path, queryParameters: filters?.toMap());
  }
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
