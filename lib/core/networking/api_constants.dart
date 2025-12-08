// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class ApiConstants {
  static const String domain = 'https://api.themoviedb.org';
  static const String path = '3';
  static String BASE_URL = '$domain/$path';

  static const int connectTimeoutDurationInSeconds = 30;
  static const int recieveTimeoutDuration = 30;
  static ApiEndPoints endPoints = ApiEndPoints();
}

class ApiEndPoints {
  final String NOW_PLAYING_MOVIES = '/movie/now_playing';
  final String POPULAR_MOVIES = '/movie/popular';
  final String TOP_RATED_MOVIES = '/movie/top_rated';
}
