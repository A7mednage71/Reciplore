import 'package:dio/dio.dart';
import 'package:looqma/core/networking/api_error.dart';
import 'package:looqma/core/networking/api_local_service.dart';
import 'package:looqma/core/networking/api_result.dart';
import 'package:looqma/features/search_recipes_with_ai/data/models/search_recipe_with_ai_request_model.dart';
import 'package:looqma/features/search_recipes_with_ai/data/models/search_recipe_with_ai_response_model.dart';

class SearchRecipesWithAiRepo {
  final ApiLocalService _apiService;
  SearchRecipesWithAiRepo(this._apiService);

  Future<ApiResult<SearchRecipeWithAiResponseModel>> searchWithAi(
      {required SearchRecipeWithAiRequestModel requestModel}) async {
    try {
      final result = await _apiService.searchRecipeWithAi(requestModel);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }
}
