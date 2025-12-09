import 'dart:io';

import 'package:dio/dio.dart';

import '../errors/exceptions.dart';
import '../networking/interface/error_response.dart';

extension DioExceptionX on DioException {
  AppException get exceptionToThrow {
    final data = response?.data;
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NoInternetConnectionException();
      case DioExceptionType.cancel:
        return CancelException(SimpleErrorResponse.fromMap(data).copyWith(code: response?.statusCode));
      case DioExceptionType.unknown:
        return UnknownException(SimpleErrorResponse(code: 0, message: "Something went wrong"));
      case DioExceptionType.badResponse:
        switch (response!.statusCode) {
          case HttpStatus.badRequest:
            return BadRequestException(SimpleErrorResponse.fromMap(data).copyWith(code: HttpStatus.badRequest));
          case HttpStatus.unprocessableEntity:
            return MissingDataException(SimpleErrorResponse.fromMap(data).copyWith(code: HttpStatus.unprocessableEntity));
          case HttpStatus.unauthorized:
          case HttpStatus.forbidden:
            return UnauthorizedException(SimpleErrorResponse.fromMap(data).copyWith(code: response?.statusCode));
          case HttpStatus.notFound:
            return NotFoundException(SimpleErrorResponse.fromMap(data).copyWith(code: HttpStatus.notFound));
          case HttpStatus.conflict:
            return ConflictException(SimpleErrorResponse.fromMap(data).copyWith(code: HttpStatus.conflict));
          case HttpStatus.internalServerError:
            return InternalServerErrorException();
          default:
            return UnknownException(SimpleErrorResponse(code: 0, message: "Something went wrong : ${data?['message']}"));
        }
      default:
        return UnknownException(SimpleErrorResponse(code: 0, message: "Something went wrong : ${data?['message']}"));
    }
  }
}
