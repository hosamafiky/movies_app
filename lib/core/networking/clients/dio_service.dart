import 'dart:async';

import 'package:cinemahub/core/networking/interface/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../errors/exceptions.dart';
import '../../extensions/dio_exception.dart';
import '../api_request.dart';
import '../extensions/on_api_request.dart';
import '../interface/error_response.dart';

class DioService implements ApiService {
  final Dio _dio;

  DioService({required Dio dio}) : _dio = dio {
    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger());
    }
  }

  Map<String, dynamic> get queries => _dio.options.queryParameters;

  @override
  Future<T> call<T extends Object?>(ApiRequest request, {FutureOr<T> Function(dynamic json)? mapper}) async {
    try {
      await request.prepareRequestData();
      final response = await _dio.request(
        request.path,
        data: request.isFormData ? FormData.fromMap(request.body!) : request.body,
        queryParameters: {..._dio.options.queryParameters, ...?request.queryParameters}..removeWhere((key, value) => value == null),
        options: Options(method: request.method.name.toUpperCase(), headers: request.headers),
        onReceiveProgress: request.hasBodyAndProgress ? request.onReceiveProgress : null,
        onSendProgress: request.hasBodyAndProgress ? request.onSendProgress : null,
      );
      if (mapper != null) return await mapper(response.data);
      return response.data as T;
    } on DioException catch (e) {
      throw e.exceptionToThrow;
    } catch (e) {
      throw UnknownException(SimpleErrorResponse(code: 0, message: e.toString()));
    }
  }
}
