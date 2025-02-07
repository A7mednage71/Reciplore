// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_info_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserInfoRequestModel _$UpdateUserInfoRequestModelFromJson(
        Map<String, dynamic> json) =>
    UpdateUserInfoRequestModel(
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      phoneNumbers: (json['phoneNumbers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      addresses:
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UpdateUserInfoRequestModelToJson(
        UpdateUserInfoRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'phoneNumbers': instance.phoneNumbers,
      'addresses': instance.addresses,
    };
