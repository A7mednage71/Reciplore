import 'package:dio/dio.dart';
import 'package:looqma/core/networking/api_error.dart';
import 'package:looqma/core/networking/api_result.dart';
import 'package:looqma/core/networking/api_service.dart';
import 'package:looqma/core/networking/response_message_model.dart';
import 'package:looqma/features/otp_verify/data/models/resend_otp_request_model.dart';
import 'package:looqma/features/otp_verify/data/models/verify_request_model.dart';
import 'package:looqma/features/otp_verify/data/models/verify_response_model.dart';

class VerficationRepo {
  final ApiService _apiService;

  VerficationRepo(this._apiService);

  Future<ApiResult<VerifyResponseModel>> verifyLogin(
      {required VerifyRequestModel verifyRequestModel}) async {
    try {
      final result = await _apiService.verifyLogin(verifyRequestModel);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }

  Future<ApiResult<ResponseMessageModel>> resendOtp(
      {required ResendOtpRequestModel resendOtpRequestModel}) async {
    try {
      final result = await _apiService.resendOtp(resendOtpRequestModel);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }
}
