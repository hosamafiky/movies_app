import 'package:cinemahub/core/dependency_injection/di.dart';
import 'package:cinemahub/core/networking/clients/dio_service.dart';

import '../../../../core/networking/api_request.dart';
import '../models/tv_show_model.dart';

abstract class TVShowRemoteDataSource {
  Future<List<TVShowModel>> getTVShows(String path);
}

class TVShowRemoteDataSourceImpl implements TVShowRemoteDataSource {
  @override
  Future<List<TVShowModel>> getTVShows(String path) async {
    final request = ApiRequest(path: path);
    return await DependencyInjector.instance.sl<DioService>().call<List<TVShowModel>>(
      request,
      mapper: (json) {
        final results = json['results'] as List<dynamic>;
        return results.map((e) => TVShowModel.fromMap(e as Map<String, dynamic>)).toList();
      },
    );
  }
}
