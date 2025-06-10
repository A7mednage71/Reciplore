import 'package:dio/dio.dart';
import 'package:looqma/core/networking/api_error.dart';
import 'package:looqma/core/networking/api_result.dart';
import 'package:looqma/core/networking/api_service.dart';
import 'package:looqma/core/networking/response_message_model.dart';

class RecipeSaveToggleRepo {
  final ApiService _apiService;

  RecipeSaveToggleRepo(this._apiService);

  Future<ApiResult<ResponseMessageModel>> recipeSaveToggle(
      {required String recipeId}) async {
    try {
      final result = await _apiService.recipeSaveToggle(recipeId);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }
}
