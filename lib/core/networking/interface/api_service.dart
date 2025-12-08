import 'dart:async';

import 'package:movies_app/core/networking/api_request.dart';

abstract class ApiService {
  Future<T> call<T extends Object?>(ApiRequest request, {FutureOr<T> Function(dynamic json)? mapper});

  Future<void> addApiKey(String apiKey);
}
