// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddReviewModel _$AddReviewModelFromJson(Map<String, dynamic> json) =>
    AddReviewModel(
      recipeId: json['recipeId'] as String?,
      ingredientId: json['ingredientId'] as String?,
      comment: json['comment'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$AddReviewModelToJson(AddReviewModel instance) =>
    <String, dynamic>{
      'recipeId': instance.recipeId,
      'ingredientId': instance.ingredientId,
      'comment': instance.comment,
      'rate': instance.rate,
    };
