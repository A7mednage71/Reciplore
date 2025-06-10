// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileResponseModel _$UserProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserProfileResponseModel(
      userId: json['_id'] as String,
      userName: json['username'] as String,
      profileImage: json['profileImage'] == null
          ? null
          : UserProfileImage.fromJson(
              json['profileImage'] as Map<String, dynamic>),
      email: json['email'] as String,
      phoneNumbers: (json['phoneNumbers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      userAddresses: (json['addresses'] as List<dynamic>)
          .map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      userRole: json['role'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      userAge: (json['age'] as num?)?.toInt(),
      nOfUpdate: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$UserProfileResponseModelToJson(
        UserProfileResponseModel instance) =>
    <String, dynamic>{
      '_id': instance.userId,
      'username': instance.userName,
      'profileImage': instance.profileImage,
      'email': instance.email,
      'phoneNumbers': instance.phoneNumbers,
      'addresses': instance.userAddresses,
      'role': instance.userRole,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'age': instance.userAge,
      '__v': instance.nOfUpdate,
    };

UserProfileImage _$UserProfileImageFromJson(Map<String, dynamic> json) =>
    UserProfileImage(
      secureProfileUrl: json['secure_url'] as String?,
    );

Map<String, dynamic> _$UserProfileImageToJson(UserProfileImage instance) =>
    <String, dynamic>{
      'secure_url': instance.secureProfileUrl,
    };
