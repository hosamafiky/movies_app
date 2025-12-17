import 'package:cinemahub/features/movies/data/models/trailer_model.dart';

import '../../../../core/dependency_injection/di.dart';
import '../../../../core/enums/media_type.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_request.dart';
import '../../../../core/networking/clients/dio_service.dart';
import '../models/movie_details_model.dart';
import '../models/movie_model.dart';

abstract class MoviesRemoteDatasource {
  Future<List<MovieModel>> getMovies(String path, {Map<String, dynamic>? queryParameters});
  Future<MovieDetailsModel> getMovieDetails(int id);
  Future<List<TrailerModel>> getMovieTrailers(int id);
}

class MoviesRemoteDatasourceImpl implements MoviesRemoteDatasource {
  @override
  Future<List<MovieModel>> getMovies(String path, {Map<String, dynamic>? queryParameters}) async {
    final request = ApiRequest(path: path, queryParameters: queryParameters);
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
    final request = ApiRequest(path: ApiConstants.endPoints.DETAILS(MediaType.movie, id));
    return await DependencyInjector.instance.sl<DioService>().call<MovieDetailsModel>(request, mapper: (json) => MovieDetailsModel.fromMap(json));
  }

  @override
  Future<List<TrailerModel>> getMovieTrailers(int id) async {
    final request = ApiRequest(path: ApiConstants.endPoints.VIDEOS(MediaType.movie, id));
    return await DependencyInjector.instance.sl<DioService>().call<List<TrailerModel>>(
      request,
      mapper: (json) {
        final results = json['results'] as List<dynamic>;
        return results.map((e) => TrailerModel.fromMap(e as Map<String, dynamic>)).toList();
      },
    );
  }
}
