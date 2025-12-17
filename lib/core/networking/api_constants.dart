// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:cinemahub/core/enums/media_type.dart';
import 'package:cinemahub/core/enums/time_window.dart';

class ApiConstants {
  static const String domain = 'https://api.themoviedb.org';
  static const String path = '3';
  static String BASE_URL = '$domain/$path';

  static String fullImage(String path) => path.contains('http') ? path : 'https://image.tmdb.org/t/p/w500$path';

  static const int connectTimeoutDurationInSeconds = 30;
  static const int recieveTimeoutDuration = 30;
  static ApiEndPoints endPoints = ApiEndPoints();
}

class ApiEndPoints {
  String TRENDING(MediaType mediaType, TimeWindow timeWindow) => '/trending/${mediaType.name}/${timeWindow.name}';
  String DISCOVER(MediaType mediaType) => '/discover/${mediaType.name}';
  String NOW_PLAYING(MediaType mediaType) => '/${mediaType.name}/now_playing';
  String POPULAR(MediaType mediaType) => '/${mediaType.name}/popular';
  String TOP_RATED(MediaType mediaType) => '/${mediaType.name}/top_rated';
  String DETAILS(MediaType mediaType, int id) => '/${mediaType.name}/$id';
  String VIDEOS(MediaType mediaType, int id) => '${DETAILS(mediaType, id)}/videos';
  String CREDITS(MediaType mediaType, int id) => '${DETAILS(mediaType, id)}/credits';
  String RATINGS(MediaType mediaType, int id) => '${DETAILS(mediaType, id)}/reviews';
  String SIMILAR(MediaType mediaType, int id) => '${DETAILS(mediaType, id)}/similar';
  String RECOMMENDATIONS(MediaType mediaType, int id) => '${DETAILS(mediaType, id)}/recommendations';

  /// Genres Endpoints
  final String GENRES = '/genre/movie/list';
}
