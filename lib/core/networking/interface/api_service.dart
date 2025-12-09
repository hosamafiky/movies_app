import 'dart:async';

import '../api_request.dart';

abstract class ApiService {
  Future<T> call<T extends Object?>(ApiRequest request, {FutureOr<T> Function(dynamic json)? mapper});

  Future<void> addApiKey(String apiKey);
}
