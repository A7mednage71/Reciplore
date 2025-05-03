import 'package:json_annotation/json_annotation.dart';

part 'chat_bot_response_model.g.dart';

@JsonSerializable()
class ChatBotResponseModel {
  final String message;
  final String recipeMarkdown;
  final String image;

  ChatBotResponseModel({
    required this.message,
    required this.recipeMarkdown,
    required this.image,
  });

  factory ChatBotResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatBotResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatBotResponseModelToJson(this);
}
