import 'package:json_annotation/json_annotation.dart';

part 'chat_bot_response_model.g.dart';

@JsonSerializable()
class ChatBotResponseModel {
  final String message;
  final String suggestion;
  final String image;

  ChatBotResponseModel(
      {required this.message, required this.suggestion, required this.image});

  Map<String, dynamic> toJson() => _$ChatBotResponseModelToJson(this);

  factory ChatBotResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatBotResponseModelFromJson(json);
}
