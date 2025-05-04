import 'package:dio/dio.dart';
import 'package:looqma/core/networking/api_error.dart';
import 'package:looqma/core/networking/api_local_service.dart';
import 'package:looqma/core/networking/api_result.dart';
import 'package:looqma/features/chat_bot/data/models/chat_bot_request_model.dart';
import 'package:looqma/features/chat_bot/data/models/chat_bot_response_model.dart';

class ChatBotRepo {
  final ApiLocalService _apiService;

  ChatBotRepo(this._apiService);

  Future<ApiResult<ChatBotResponseModel>> chatBotRecommendation(
      {required ChatBotRequestModel message}) async {
    try {
      final result = await _apiService.chatBotRecommendation(message);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }
}
