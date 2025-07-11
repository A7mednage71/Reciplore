// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reviews_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReviewsResponseModel _$GetReviewsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetReviewsResponseModel(
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetReviewsResponseModelToJson(
        GetReviewsResponseModel instance) =>
    <String, dynamic>{
      'reviews': instance.reviews,
    };

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      id: json['_id'] as String,
      comment: json['comment'] as String?,
      rate: (json['rate'] as num).toDouble(),
      recipe: json['recipe'] as String?,
      ingredient: json['ingredient'] as String?,
      createdAt: json['createdAt'] as String,
      user: UserReviewModel.fromJson(json['userID'] as Map<String, dynamic>),
      likesCount: (json['likesCount'] as num).toInt(),
      dislikesCount: (json['dislikesCount'] as num).toInt(),
      userAction: json['userAction'] as String?,
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'comment': instance.comment,
      'rate': instance.rate,
      'recipe': instance.recipe,
      'ingredient': instance.ingredient,
      'createdAt': instance.createdAt,
      'userID': instance.user,
      'likesCount': instance.likesCount,
      'dislikesCount': instance.dislikesCount,
      'userAction': instance.userAction,
    };

UserReviewModel _$UserReviewModelFromJson(Map<String, dynamic> json) =>
    UserReviewModel(
      id: json['_id'] as String,
      userName: json['username'] as String,
      email: json['email'] as String,
      profileImage:
          ImageURL.fromJson(json['profileImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserReviewModelToJson(UserReviewModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.userName,
      'email': instance.email,
      'profileImage': instance.profileImage,
    };
