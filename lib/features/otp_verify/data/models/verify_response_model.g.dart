// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyResponseModel _$VerifyResponseModelFromJson(Map<String, dynamic> json) =>
    VerifyResponseModel(
      message: json['message'] as String,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$VerifyResponseModelToJson(
        VerifyResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
    };
