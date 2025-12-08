import 'package:movies_app/core/dependency_injection/di.dart';
import 'package:movies_app/core/networking/api_constants.dart';
import 'package:movies_app/core/networking/clients/dio_service.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';

import '../../../core/networking/api_request.dart';
import '../models/movie_details_model.dart';

abstract class MoviesRemoteDatasource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(int id);
  Future<List<MovieModel>> getMovieRecommendations(int id);
}

class MoviesRemoteDatasourceImpl implements MoviesRemoteDatasource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final request = ApiRequest(path: ApiConstants.endPoints.NOW_PLAYING_MOVIES);
    return await DependencyInjector.instance.sl<DioService>().call<List<MovieModel>>(
      request,
      mapper: (json) {
        final results = json['results'] as List<dynamic>;
        return results.map((e) => MovieModel.fromMap(e as Map<String, dynamic>)).toList();
      },
    );
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final request = ApiRequest(path: ApiConstants.endPoints.POPULAR_MOVIES);
    return await DependencyInjector.instance.sl<DioService>().call<List<MovieModel>>(
      request,
      mapper: (json) {
        final results = json['results'] as List<dynamic>;
        return results.map((e) => MovieModel.fromMap(e as Map<String, dynamic>)).toList();
      },
    );
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final request = ApiRequest(path: ApiConstants.endPoints.TOP_RATED_MOVIES);
    return await DependencyInjector.instance.sl<DioService>().call<List<MovieModel>>(
      request,
      mapper: (json) {
        final results = json['results'] as List<dynamic>;
        return results.map((e) => MovieModel.fromMap(e as Map<String, dynamic>)).toList();
      },
    );
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int id) async {
    final request = ApiRequest(path: ApiConstants.endPoints.MOVIE_DETAILS(id));
    return await DependencyInjector.instance.sl<DioService>().call<MovieDetailsModel>(request, mapper: (json) => MovieDetailsModel.fromMap(json));
  }

  @override
  Future<List<MovieModel>> getMovieRecommendations(int id) async {
    final request = ApiRequest(path: ApiConstants.endPoints.RECOMMENDATIONS(id));
    return await DependencyInjector.instance.sl<DioService>().call<List<MovieModel>>(
      request,
      mapper: (json) {
        final results = json['results'] as List<dynamic>;
        return results.map((e) => MovieModel.fromMap(e as Map<String, dynamic>)).toList();
      },
    );
  }
}
