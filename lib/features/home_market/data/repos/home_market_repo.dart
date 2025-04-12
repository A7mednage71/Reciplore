import 'package:dio/dio.dart';
import 'package:looqma/core/common/models/get_ingredients_query_model.dart';
import 'package:looqma/core/common/models/get_ingredients_response_model.dart';
import 'package:looqma/core/networking/api_error.dart';
import 'package:looqma/core/networking/api_result.dart';
import 'package:looqma/core/networking/api_service.dart';
import 'package:looqma/features/home_market/data/models/market_banners_reponse_model.dart';

class HomeMarketRepo {
  final ApiService _apiService;

  HomeMarketRepo(this._apiService);

  Future<ApiResult<GetIngredientsResponseModel>> getIngredients({
    required GetIngredientsQueryModel query,
  }) async {
    try {
      final result = await _apiService.getIngredients(query);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }

  Future<ApiResult<MarketBannersReponseModel>> getMarketBanners() async {
    try {
      final result = await _apiService.getMarketBanners();
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }
}
