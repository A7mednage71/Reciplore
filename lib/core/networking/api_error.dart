import 'package:dio/dio.dart';

class ApiError {
  const ApiError(this.errMessages);
  final String errMessages;
}

class ServerFailure extends ApiError {
  ServerFailure(super.errMessages);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with Api Server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure('Dad Certificate with api server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode!,
          e.response?.data['message'],
        );

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');

      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');

      case DioExceptionType.unknown:
        return ServerFailure('unknown');

      // ignore: no_default_cases
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response as String);
    } else if (statusCode == 404) {
      // 'Your request not found, Please try later!'
      return ServerFailure(response as String);
    } else if (statusCode == 500) {
      return ServerFailure(
        'There is the problem with server, Please try later',
      );
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
