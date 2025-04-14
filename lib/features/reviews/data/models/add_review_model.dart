import 'package:json_annotation/json_annotation.dart';

part 'add_review_model.g.dart';

@JsonSerializable()
class AddReviewModel {
  final String? recipeId;
  final String? ingredientId;
  final String comment;
  final int rate;

  AddReviewModel({
    required this.recipeId,
    required this.ingredientId,
    required this.comment,
    required this.rate,
  });

  factory AddReviewModel.fromJson(Map<String, dynamic> json) =>
      _$AddReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddReviewModelToJson(this);
}
