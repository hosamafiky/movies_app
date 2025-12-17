import 'package:cinemahub/core/dependency_injection/di.dart';
import 'package:cinemahub/core/networking/api_constants.dart';
import 'package:cinemahub/core/networking/api_request.dart';
import 'package:cinemahub/core/networking/clients/dio_service.dart';
import 'package:cinemahub/features/cast/data/models/actor_model.dart';

import '../../../../core/enums/media_type.dart';

abstract class CastRemoteDataSource {
  Future<List<ActorModel>> getCast(MediaType mediaType, int id);
}

class CastRemoteDataSourceImpl implements CastRemoteDataSource {
  @override
  Future<List<ActorModel>> getCast(MediaType mediaType, int id) async {
    final request = ApiRequest(path: ApiConstants.endPoints.CREDITS(mediaType, id));
    return await DependencyInjector.instance.sl<DioService>().call(
      request,
      mapper: (data) {
        final results = data['cast'] as List<dynamic>? ?? [];
        return results.map((e) => ActorModel.fromMap(e as Map<String, dynamic>)).toList();
      },
    );
  }
}
