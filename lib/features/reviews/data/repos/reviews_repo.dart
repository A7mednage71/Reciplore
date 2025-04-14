import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:looqma/core/networking/api_error.dart';
import 'package:looqma/core/networking/api_result.dart';
import 'package:looqma/core/networking/api_service.dart';
import 'package:looqma/core/networking/response_message_model.dart';
import 'package:looqma/features/reviews/data/models/add_review_model.dart';
import 'package:looqma/features/reviews/data/models/get_reviews_response_model.dart';

class ReviewsRepo {
  final ApiService _apiService;
  const ReviewsRepo(this._apiService);

  Future<ApiResult<GetReviewsResponseModel>> getReviews(
      {String? recipeId, String? ingredientId}) async {
    try {
      final result = await _apiService.getReviews(recipeId, ingredientId);
      return ApiResult.success(result);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }

  Future<ApiResult<ResponseMessageModel>> addReview(
      AddReviewModel model) async {
    try {
      final result = await _apiService.addReview(model);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }

  Future<ApiResult<ResponseMessageModel>> makeReaction(
      String id, String reaction) async {
    try {
      final result = await _apiService.makeReaction(id, reaction);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }
}
