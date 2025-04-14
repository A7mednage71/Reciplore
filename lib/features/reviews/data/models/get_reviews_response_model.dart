import 'package:json_annotation/json_annotation.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';

part 'get_reviews_response_model.g.dart';

@JsonSerializable()
class GetReviewsResponseModel {
  final List<ReviewModel> reviews;

  GetReviewsResponseModel({required this.reviews});

  factory GetReviewsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetReviewsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetReviewsResponseModelToJson(this);
}

@JsonSerializable()
class ReviewModel {
  @JsonKey(name: '_id')
  final String id;
  final String comment;
  final int rate;
  final String? recipe;
  final String? ingredient;
  final String createdAt;
  @JsonKey(name: 'userID')
  final UserReviewModel user;
  final List<String> likes;
  final List<String> dislikes;

  ReviewModel({
    required this.id,
    required this.comment,
    required this.rate,
    this.recipe,
    this.ingredient,
    required this.createdAt,
    required this.user,
    required this.likes,
    required this.dislikes,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}

@JsonSerializable()
class UserReviewModel {
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'username')
  final String userName;
  final String email;
  final ImageURL profileImage;

  UserReviewModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.profileImage,
  });

  factory UserReviewModel.fromJson(Map<String, dynamic> json) =>
      _$UserReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserReviewModelToJson(this);
}
