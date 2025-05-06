// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyResponseModel _$VerifyResponseModelFromJson(Map<String, dynamic> json) =>
    VerifyResponseModel(
      message: json['message'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      userId: json['_id'] as String,
      userName: json['username'] as String,
      profileImage:
          ImageURL.fromJson(json['profileImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyResponseModelToJson(
        VerifyResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      '_id': instance.userId,
      'username': instance.userName,
      'profileImage': instance.profileImage,
    };
