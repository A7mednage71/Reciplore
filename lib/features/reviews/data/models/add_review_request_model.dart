import 'package:json_annotation/json_annotation.dart';

part 'add_review_request_model.g.dart';

@JsonSerializable()
class AddReviewRequestModel {
  final String? recipeId;
  final String? ingredientId;
  final String comment;
  final double rate;

  AddReviewRequestModel({
    required this.recipeId,
    required this.ingredientId,
    required this.comment,
    required this.rate,
  });

  factory AddReviewRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddReviewRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddReviewRequestModelToJson(this);
}
