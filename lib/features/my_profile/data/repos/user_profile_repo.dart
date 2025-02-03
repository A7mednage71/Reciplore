import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:looqma/core/networking/api_error.dart';
import 'package:looqma/core/networking/api_result.dart';
import 'package:looqma/core/networking/api_service.dart';
import 'package:looqma/features/my_profile/data/models/user_profile_response_model.dart';

class UserProfileRepo {
  UserProfileRepo(this._apiService);

  final ApiService _apiService;

  Future<ApiResult<UserProfileResponseModel>> getUserProfile() async {
    try {
      final result = await _apiService.getUserProfile();
      return ApiResult.success(result);
    } catch (e) {
      log("Error: $e");
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }
}
