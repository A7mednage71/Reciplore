import 'package:json_annotation/json_annotation.dart';

part 'chat_bot_request_model.g.dart';
@JsonSerializable()
class ChatBotRequestModel{
  final String ingredients;

  ChatBotRequestModel({required this.ingredients});

  Map<String, dynamic> toJson()=> _$ChatBotRequestModelToJson(this);

  factory ChatBotRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ChatBotRequestModelFromJson(json);
}