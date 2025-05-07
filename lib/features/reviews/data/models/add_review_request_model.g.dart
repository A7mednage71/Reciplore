// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_review_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddReviewRequestModel _$AddReviewRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddReviewRequestModel(
      recipeId: json['recipeId'] as String?,
      ingredientId: json['ingredientId'] as String?,
      comment: json['comment'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$AddReviewRequestModelToJson(
        AddReviewRequestModel instance) =>
    <String, dynamic>{
      'recipeId': instance.recipeId,
      'ingredientId': instance.ingredientId,
      'comment': instance.comment,
      'rate': instance.rate,
    };
