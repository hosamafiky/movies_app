import 'package:equatable/equatable.dart';

import '../networking/interface/error_response.dart';

class AppException extends Equatable implements Exception {
  final ErrorResponse response;

  const AppException(this.response);

  @override
  String toString() => response.message;

  @override
  List<Object?> get props => [response.code, response.message];
}

class FetchDataException extends AppException {
  const FetchDataException(super.response);
}

class BadRequestException extends AppException {
  const BadRequestException(super.response);
}

class CancelException extends AppException {
  const CancelException(super.response);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException(super.response);
}

class MissingDataException extends AppException {
  const MissingDataException(super.response);
}

class NotFoundException extends AppException {
  const NotFoundException(super.response);
}

class ConflictException extends AppException {
  const ConflictException(super.response);
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException() : super(SimpleErrorResponse(code: 500, message: "Internal Server Error"));
}

class NoInternetConnectionException extends AppException {
  NoInternetConnectionException() : super(SimpleErrorResponse(code: 0, message: "No Internet Connection"));
}

class CacheException extends AppException {
  const CacheException(super.response);
}

class UnknownException extends AppException {
  const UnknownException(super.response);
}
