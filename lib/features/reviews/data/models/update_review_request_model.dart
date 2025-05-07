import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_review_request_model.g.dart';

@JsonSerializable()
class UpdateReviewRequestModel {
  UpdateReviewRequestModel({
    required this.comment,
    required this.rate,
  });

  final String comment;
  final double rate;

  factory UpdateReviewRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateReviewRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateReviewRequestModelToJson(this);
}
