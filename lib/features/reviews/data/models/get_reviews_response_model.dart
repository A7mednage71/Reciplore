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

  GetReviewsResponseModel copyWith({
    List<ReviewModel>? reviews,
  }) {
    return GetReviewsResponseModel(
      reviews: reviews ?? this.reviews,
    );
  }
}

@JsonSerializable()
class ReviewModel {
  @JsonKey(name: '_id')
  final String id;
  final String? comment;
  final double rate;
  final String? recipe;
  final String? ingredient;
  final String createdAt;
  @JsonKey(name: 'userID')
  final UserReviewModel user;
  final int likesCount;
  final int dislikesCount;
  final String? userAction;

  ReviewModel({
    required this.id,
    required this.comment,
    required this.rate,
    this.recipe,
    this.ingredient,
    required this.createdAt,
    required this.user,
    required this.likesCount,
    required this.dislikesCount,
    this.userAction,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);

  ReviewModel copyWith({
    String? id,
    String? comment,
    double? rate,
    String? recipe,
    String? ingredient,
    String? createdAt,
    UserReviewModel? user,
    int? likesCount,
    int? dislikesCount,
    String? userAction,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      comment: comment ?? this.comment,
      rate: rate ?? this.rate,
      recipe: recipe ?? this.recipe,
      ingredient: ingredient ?? this.ingredient,
      createdAt: createdAt ?? this.createdAt,
      user: user ?? this.user,
      likesCount: likesCount ?? this.likesCount,
      dislikesCount: dislikesCount ?? this.dislikesCount,
      userAction: userAction ?? this.userAction,
    );
  }
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
