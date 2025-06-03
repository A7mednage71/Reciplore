import 'package:json_annotation/json_annotation.dart';

part 'chat_bot_request_model.g.dart';

@JsonSerializable()
class ChatBotRequestModel {
  final String? ingredients;
  final String? mood;

  ChatBotRequestModel({this.ingredients, this.mood});
  factory ChatBotRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ChatBotRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatBotRequestModelToJson(this);
}
