import 'package:dio/dio.dart';
import 'package:looqma/core/networking/api_error.dart';
import 'package:looqma/core/networking/api_local_service.dart';
import 'package:looqma/core/networking/api_result.dart';
import 'package:looqma/core/networking/response_message_model.dart';
import 'package:looqma/features/diet_plan/data/models/diet_plan_request_model.dart';

class DietPlanRepo {
  final ApiLocalService _apiService;

  DietPlanRepo(this._apiService);

  Future<ApiResult<ResponseMessageModel>> recommendationByDietPlan(
      DietPlanRequestModel model) async {
    try {
      final result = await _apiService.dietPlan(model);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }
}
