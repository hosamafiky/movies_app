import 'package:movies_app/core/dependency_injection/di.dart';
import 'package:movies_app/core/networking/api_constants.dart';
import 'package:movies_app/core/networking/clients/dio_service.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';

import '../../../core/networking/api_request.dart';

abstract class MoviesRemoteDatasource {
  Future<List<MovieModel>> getNowPlayingMovies();
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
}
