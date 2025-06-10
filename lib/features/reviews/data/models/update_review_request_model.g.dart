// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_review_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateReviewRequestModel _$UpdateReviewRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateReviewRequestModel(
      comment: json['comment'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$UpdateReviewRequestModelToJson(
        UpdateReviewRequestModel instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'rate': instance.rate,
    };
