// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_reaction_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeReactionResponseModel _$MakeReactionResponseModelFromJson(
        Map<String, dynamic> json) =>
    MakeReactionResponseModel(
      likes: (json['likes'] as num?)?.toInt(),
      dislikes: (json['dislikes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MakeReactionResponseModelToJson(
        MakeReactionResponseModel instance) =>
    <String, dynamic>{
      'likes': instance.likes,
      'dislikes': instance.dislikes,
    };
