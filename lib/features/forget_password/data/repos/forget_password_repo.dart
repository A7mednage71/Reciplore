import 'package:dio/dio.dart';
import 'package:looqma/core/networking/api_error.dart';
import 'package:looqma/core/networking/api_result.dart';
import 'package:looqma/core/networking/api_service.dart';
import 'package:looqma/core/networking/response_message_model.dart';
import 'package:looqma/features/forget_password/data/models/forget_password_request_model.dart';

class ForgetPasswordRepo {
  final ApiService _apiService;

  ForgetPasswordRepo(this._apiService);

  Future<ApiResult<ResponseMessageModel>> forgetPassword(
      {required ForgetPasswordRequestModel requestModel}) async {
    try {
      final result = await _apiService.forgetPassword(requestModel);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }
}
