import 'package:cinemahub/core/dependency_injection/di.dart';
import 'package:cinemahub/core/networking/api_constants.dart';
import 'package:cinemahub/core/networking/clients/dio_service.dart';

import '../../../../core/networking/api_request.dart';
import '../models/genre_model.dart';

abstract class GenreRemoteDataSource {
  Future<List<GenreModel>> getGenres();
}

class GenreRemoteDataSourceImpl implements GenreRemoteDataSource {
  @override
  Future<List<GenreModel>> getGenres() async {
    final request = ApiRequest(path: ApiConstants.endPoints.GENRES);
    return await DependencyInjector.instance.sl<DioService>().call<List<GenreModel>>(
      request,
      mapper: (json) {
        final results = json['genres'] as List<dynamic>;
        return results.map((e) => GenreModel.fromMap(e as Map<String, dynamic>)).toList();
      },
    );
  }
}
