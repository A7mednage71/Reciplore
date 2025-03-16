import 'package:dio/dio.dart';
import 'package:looqma/core/networking/api_error.dart';
import 'package:looqma/core/networking/api_result.dart';
import 'package:looqma/core/networking/api_service.dart';
import 'package:looqma/core/networking/response_message_model.dart';
import 'package:looqma/features/sigh_up/data/models/sign_up_request_model.dart';

class SighnUpRepo {
  final ApiService _apiService;

  SighnUpRepo(this._apiService);

  Future<ApiResult<ResponseMessageModel>> signUp(
      {required SignUpRequestModel body}) async {
    try {
      final response = await _apiService.signUp(body);
      return ApiResult.success(response);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }
}
