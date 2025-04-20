// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_bot_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatBotResponseModel _$ChatBotResponseModelFromJson(
        Map<String, dynamic> json) =>
    ChatBotResponseModel(
      message: json['message'] as String,
      suggestion: json['suggestion'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$ChatBotResponseModelToJson(
        ChatBotResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'suggestion': instance.suggestion,
      'image': instance.image,
    };
