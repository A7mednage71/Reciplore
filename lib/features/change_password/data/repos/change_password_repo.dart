import 'package:dio/dio.dart';
import 'package:looqma/core/networking/api_error.dart';
import 'package:looqma/core/networking/api_result.dart';
import 'package:looqma/core/networking/api_service.dart';
import 'package:looqma/core/networking/response_message_model.dart';
import 'package:looqma/features/change_password/data/models/change_password_request_model.dart';

class ChangePasswordRepo {
  final ApiService _apiService;
  ChangePasswordRepo(this._apiService);

  Future<ApiResult<ResponseMessageModel>> changePassword(
      {required ChangePasswordRequestModel requestModel}) async {
    try {
      final result = await _apiService.changePassword(requestModel);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }
}
