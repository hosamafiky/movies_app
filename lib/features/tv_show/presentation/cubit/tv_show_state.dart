part of 'tv_show_cubit.dart';

class TVShowState extends Equatable {
  const TVShowState({this.trendingStatus = UsecaseStatus.initial, this.trendingError, this.trendingTVShows = const []});

  final UsecaseStatus trendingStatus;
  final ErrorResponse? trendingError;
  final List<TVShow> trendingTVShows;

  TVShowState copyWith({UsecaseStatus? trendingStatus, ErrorResponse? trendingError, List<TVShow>? trendingTVShows}) {
    return TVShowState(
      trendingStatus: trendingStatus ?? this.trendingStatus,
      trendingError: trendingError ?? this.trendingError,
      trendingTVShows: trendingTVShows ?? this.trendingTVShows,
    );
  }

  @override
  List<Object?> get props => [trendingStatus, trendingError, trendingTVShows];
}
