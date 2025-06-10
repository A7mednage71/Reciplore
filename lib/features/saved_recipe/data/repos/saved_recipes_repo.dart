import 'package:dio/dio.dart';
import 'package:looqma/core/networking/api_error.dart';
import 'package:looqma/core/networking/api_result.dart';
import 'package:looqma/core/networking/api_service.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';

class SavedRecipesRepo {
  final ApiService _apiService;

  SavedRecipesRepo(this._apiService);

  Future<ApiResult<GetRecipesResponseModel>> getSavedRecipes() async {
    try {
      final result = await _apiService.getSavedRecipes();
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }
}
