import 'package:dio/dio.dart';

enum RequestMethod { get, post, put, delete }

class ApiRequest {
  final String path;
  final RequestMethod method;
  final ResponseType responseType;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? body;
  final Map<String, String>? headers;
  final ProgressCallback? onSendProgress;
  final ProgressCallback? onReceiveProgress;

  bool isFormData;

  ApiRequest({
    required this.path,
    this.method = RequestMethod.get,
    this.responseType = ResponseType.json,
    this.queryParameters,
    this.headers,
    this.body,
    this.onSendProgress,
    this.onReceiveProgress,
    this.isFormData = false,
  });

  ApiRequest copyWith({
    String? path,
    RequestMethod? method,
    ResponseType? responseType,
    bool? isFormData,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return ApiRequest(
      path: path ?? this.path,
      method: method ?? this.method,
      responseType: responseType ?? this.responseType,
      isFormData: isFormData ?? this.isFormData,
      queryParameters: queryParameters ?? this.queryParameters,
      body: body ?? this.body,
      headers: headers ?? this.headers,
      onSendProgress: onSendProgress ?? this.onSendProgress,
      onReceiveProgress: onReceiveProgress ?? this.onReceiveProgress,
    );
  }
}
