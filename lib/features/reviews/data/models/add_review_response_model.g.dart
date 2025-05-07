// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_review_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddReviewResponseModel _$AddReviewResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddReviewResponseModel(
      message: json['message'] as String,
      review: ReviewModel.fromJson(json['review'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddReviewResponseModelToJson(
        AddReviewResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'review': instance.review,
    };
