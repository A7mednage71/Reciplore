import 'package:dio/dio.dart';
import 'package:looqma/core/networking/api_error.dart';
import 'package:looqma/core/networking/api_result.dart';
import 'package:looqma/core/networking/api_service.dart';
import 'package:looqma/core/networking/response_message_model.dart';
import 'package:looqma/features/reviews/data/models/add_review_request_model.dart';
import 'package:looqma/features/reviews/data/models/add_review_response_model.dart';
import 'package:looqma/features/reviews/data/models/get_reviews_response_model.dart';
import 'package:looqma/features/reviews/data/models/make_reaction_response_model.dart';
import 'package:looqma/features/reviews/data/models/update_review_request_model.dart';

class ReviewsRepo {
  final ApiService _apiService;
  const ReviewsRepo(this._apiService);

  Future<ApiResult<GetReviewsResponseModel>> getReviews(
      {String? recipeId, String? ingredientId}) async {
    try {
      final result = await _apiService.getReviews(recipeId, ingredientId);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }

  Future<ApiResult<AddReviewResponseModel>> addReview(
      AddReviewRequestModel model) async {
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

  Future<ApiResult<ResponseMessageModel>> deleteReview(String id) async {
    try {
      final result = await _apiService.deleteReview(id);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }

  Future<ApiResult<ResponseMessageModel>> updateReview(
      String id, UpdateReviewRequestModel model) async {
    try {
      final result = await _apiService.updateReview(id, model);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }

  Future<ApiResult<MakeReactionResponseModel>> makeReaction(
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
