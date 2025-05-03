import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:looqma/core/networking/api_constants.dart';
import 'package:looqma/core/networking/api_service.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/services/secure_storage/secure_storage.dart';
import 'package:looqma/core/services/secure_storage/secure_storage_keys.dart';
import 'package:looqma/my_app.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Dio? localDio;

  static Future<Dio> getDio() async {
    const timeOut = Duration(seconds: 30);
    dio ??= Dio()
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut;

    dio!.options.headers = {
      'Content-Type': 'application/json',
      'accessToken':
          '${ApiConstants.accessTokenPrefix}${await _readAccessToken()}',
    };

    addDioInterceptors();
    return dio!;
  }

  /// Returns a [Dio] instance configured for the local server with a 60-second
  /// connection and receive timeout, used for services like AI running on localhost.
  static Future<Dio> getLocalDio() async {
    const timeOut = Duration(seconds: 60);
    localDio ??= Dio()
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut;
    return localDio!;
  }

  static refreshHeaders({required String token}) {
    log('Refreshed Headers : $token');
    dio!.options.headers['accessToken'] =
        '${ApiConstants.accessTokenPrefix}$token';
  }

  static void addDioInterceptors() {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _readAccessToken();
          options.headers['accessToken'] =
              '${ApiConstants.accessTokenPrefix}$token';
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            final refreshToken = await _readRefreshToken();

            if (refreshToken != null) {
              try {
                final newAccessToken = await refreshTokenApi(refreshToken);
                refreshHeaders(token: newAccessToken);

                error.requestOptions.headers['accessToken'] =
                    '${ApiConstants.accessTokenPrefix}$newAccessToken';

                log('Refreshed token is active: $newAccessToken');
                final response = await dio!.fetch(error.requestOptions);
                return handler.resolve(response);
              } catch (e) {
                log('Refresh token failed: $e');
                await SecureStorage.clearAllData();
                navigatorKey.currentState!.pushReplacementNamed(Routes.login);
                return handler.reject(error);
              }
            }
          }
          return handler.next(error);
        },
      ),
    );

    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  static Future<String> refreshTokenApi(String refreshToken) async {
    final response = await ApiService(dio!).refreshToken(refreshToken);
    await SecureStorage.setSecuredData(
        SecureStorageKeys.accessToken, response.accessToken);
    await SecureStorage.setSecuredData(
        SecureStorageKeys.refreshToken, response.refreshToken);
    return response.accessToken;
  }

  static Future<String?> _readAccessToken() async {
    return await SecureStorage.getSecuredData(SecureStorageKeys.accessToken);
  }

  static Future<String?> _readRefreshToken() async {
    return await SecureStorage.getSecuredData(SecureStorageKeys.refreshToken);
  }
}

// The singleton pattern is well-implemented using 
//a private constructor and a static method. 
// This ensures that only one instance of Dio
// is created throughout the application.
