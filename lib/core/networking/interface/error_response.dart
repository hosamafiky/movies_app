abstract class ErrorResponse {
  int get code;
  String get message;

  const ErrorResponse();
}

class SimpleErrorResponse extends ErrorResponse {
  @override
  final int code;
  @override
  final String message;

  const SimpleErrorResponse({required this.code, required this.message});

  SimpleErrorResponse copyWith({int? code, String? message}) {
    return SimpleErrorResponse(code: code ?? this.code, message: message ?? this.message);
  }

  factory SimpleErrorResponse.fromMap(Map<String, dynamic> map) {
    return SimpleErrorResponse(code: map['status_code'] as int, message: map['status_message'] as String);
  }

  @override
  String toString() => 'ErrorResponse(code: $code, message: $message)';
}
