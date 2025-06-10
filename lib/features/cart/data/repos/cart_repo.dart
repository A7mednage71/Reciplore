import 'package:dio/dio.dart';
import 'package:looqma/core/networking/api_error.dart';
import 'package:looqma/core/networking/api_result.dart';
import 'package:looqma/core/networking/api_service.dart';
import 'package:looqma/core/networking/response_message_model.dart';
import 'package:looqma/features/cart/data/models/add_to_cart_request_model.dart';
import 'package:looqma/features/cart/data/models/get_cart_reponse_model.dart';
import 'package:looqma/features/cart/data/models/update_cart_request_model.dart';

class CartRepo {
  final ApiService _apiService;
  CartRepo(this._apiService);

  Future<ApiResult<GetCartReponseModel>> getCart() async {
    try {
      final result = await _apiService.getCart();
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }

  Future<ApiResult<ResponseMessageModel>> addToCart(
      {required AddToCartRequestModel addToCartRequestModel}) async {
    try {
      final result = await _apiService.addToCart(addToCartRequestModel);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }

  Future<ApiResult<ResponseMessageModel>> removeFromCart(String id) async {
    try {
      final result = await _apiService.removeFromCart(id);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }

  Future<ApiResult<ResponseMessageModel>> updateCart(
      String id, UpdateCartRequestModel updateCartRequestModel) async {
    try {
      final result = await _apiService.updateCart(id, updateCartRequestModel);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }

  Future<ApiResult<ResponseMessageModel>> clearCart() async {
    try {
      final result = await _apiService.clearCart();
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }
}
