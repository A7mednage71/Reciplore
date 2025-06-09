import 'package:dio/dio.dart';
import 'package:looqma/core/networking/api_error.dart';
import 'package:looqma/core/networking/api_result.dart';
import 'package:looqma/core/networking/api_service.dart';
import 'package:looqma/core/networking/response_message_model.dart';
import 'package:looqma/features/checkout/data/models/add_and_update_address_request_model.dart';
import 'package:looqma/features/checkout/data/models/add_and_update_address_response_model.dart';
import 'package:looqma/features/checkout/data/models/cart_overview_response_model.dart';
import 'package:looqma/features/checkout/data/models/check_coupon_request_model.dart';
import 'package:looqma/features/checkout/data/models/check_coupon_response_model.dart';
import 'package:looqma/features/checkout/data/models/checkout_session_response_model.dart';
import 'package:looqma/features/checkout/data/models/place_order_request_model.dart';
import 'package:looqma/features/checkout/data/models/place_order_response_model.dart';

class CheckoutRepo {
  final ApiService _apiService;

  CheckoutRepo(this._apiService);

  Future<ApiResult<CartOverviewResponseModel>> getCartOverview() async {
    try {
      final result = await _apiService.getCartOverview();
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }

  Future<ApiResult<CheckCouponResponseModel>> chechCoupon(
      {required CheckCouponRequestModel checkCouponRequestModel}) async {
    try {
      final result = await _apiService.checkCoupon(checkCouponRequestModel);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }

  Future<ApiResult<PlaceOrderResponseModel>> placeOrder(
      {required PlaceOrderRequestModel placeOrderRequestModel}) async {
    try {
      final result = await _apiService.placeOrder(placeOrderRequestModel);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }

  Future<ApiResult<CheckoutSessionResponseModel>> payWithStripe(
      {required String orderId}) async {
    try {
      final result = await _apiService.payWithStripe(orderId);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }

  Future<ApiResult<AddAndUpdateAddressResponseModel>> addNewAddress(
      {required AddAndUpdateAddressRequestModel
          addAndUpdateAddressModel}) async {
    try {
      final result = await _apiService.addNewAddress(addAndUpdateAddressModel);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }

  Future<ApiResult<AddAndUpdateAddressResponseModel>> updateAddress(
      {required String id,
      required AddAndUpdateAddressRequestModel
          addAndUpdateAddressModel}) async {
    try {
      final result =
          await _apiService.updateAddress(id, addAndUpdateAddressModel);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }

  Future<ApiResult<ResponseMessageModel>> deleteAddress(
      {required String id}) async {
    try {
      final result = await _apiService.deleteAddress(id);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }
}
