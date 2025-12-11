import 'dart:io';

import 'package:cinemahub/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/filter/di/setup_filter_dependencies.dart';
import '../../features/movies/di/setup_movies_dependencies.dart';
import '../../features/tv_show/di/setup_tv_shows_dependencies.dart';
import '../networking/clients/dio_service.dart';
import '../networking/interface/api_service.dart';

class DependencyInjector {
  DependencyInjector._();
  static final DependencyInjector instance = DependencyInjector._();
  factory DependencyInjector() => instance;

  final GetIt sl = GetIt.instance;

  Future<void> registerDependencies(String apiKey) async {
    setUpGeneralDependencies(apiKey);
    setUpMoviesDependencies();
    setUpTVShowsDependencies();
    setUpGenreDependencies();
  }

  void setUpGeneralDependencies(String apiKey) {
    sl.registerLazySingleton<Dio>(() {
      return Dio(
        BaseOptions(
          baseUrl: ApiConstants.BASE_URL,
          connectTimeout: const Duration(seconds: ApiConstants.connectTimeoutDurationInSeconds),
          receiveTimeout: const Duration(seconds: ApiConstants.connectTimeoutDurationInSeconds),
          responseType: ResponseType.json,
          headers: {HttpHeaders.acceptHeader: ContentType.json},
          queryParameters: {'api_key': apiKey},
        ),
      );
    });

    sl.registerLazySingleton<DioService>(() => DioService(dio: sl()));
    sl.registerLazySingleton<ApiService>(() => sl<DioService>());
  }
}
