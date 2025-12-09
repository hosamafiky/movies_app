part of 'genre_cubit.dart';

class GenreState extends Equatable {
  const GenreState({this.status = UsecaseStatus.initial, this.error, this.genres = const []});

  final UsecaseStatus status;
  final ErrorResponse? error;
  final List<Genre> genres;

  GenreState copyWith({UsecaseStatus? status, ErrorResponse? error, List<Genre>? genres}) {
    return GenreState(status: status ?? this.status, error: error ?? this.error, genres: genres ?? this.genres);
  }

  @override
  List<Object?> get props => [status, error, genres];
}
