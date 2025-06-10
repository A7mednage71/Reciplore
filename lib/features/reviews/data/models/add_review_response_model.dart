import 'package:json_annotation/json_annotation.dart';
import 'package:looqma/features/reviews/data/models/get_reviews_response_model.dart';

part 'add_review_response_model.g.dart';

@JsonSerializable()
class AddReviewResponseModel {
  final String message;
  final ReviewModel review;

  AddReviewResponseModel({required this.message, required this.review});

  factory AddReviewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddReviewResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddReviewResponseModelToJson(this);
}
