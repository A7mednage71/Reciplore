import 'package:dio/dio.dart';
import 'package:looqma/core/networking/api_constants.dart';
import 'package:looqma/features/chat_bot/data/models/chat_bot_request_model.dart';
import 'package:looqma/features/chat_bot/data/models/chat_bot_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_local_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrlEmulator)
abstract class ApiLocalService {
  factory ApiLocalService(Dio dio) => _ApiLocalService(dio);

  // AI services
  @POST(ApiConstants.chatBotByIngredients)
  Future<ChatBotResponseModel> recommendationByIngrdients(
    @Body() ChatBotRequestModel body,
  );

  @POST(ApiConstants.chatBotByMood)
  Future<ChatBotResponseModel> recommendationByMood(
    @Body() ChatBotRequestModel body,
  );
}
