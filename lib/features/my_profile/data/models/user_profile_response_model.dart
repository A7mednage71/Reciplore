import 'package:json_annotation/json_annotation.dart';

part 'user_profile_response_model.g.dart';
@JsonSerializable()
class UserProfileResponseModel {
  @JsonKey(name: '_id')
  final String userId;

  @JsonKey(name: 'username')
  final String userName;

  final UserProfileImage? profileImage;

  final String email;
  final List<String> phoneNumbers;

  @JsonKey(name: 'addresses')
  final List<String?> userAddresses;

  @JsonKey(name: 'role')
  final String userRole;

  final String createdAt;
  final String updatedAt;

  @JsonKey(name: 'age')
  final String? userAge;

  @JsonKey(name: '__v')
  final int nOfUpdate;

  UserProfileResponseModel(
      {required this.userId,
      required this.userName,
      required this.profileImage,
      required this.email,
      required this.phoneNumbers,
      required this.userAddresses,
      required this.userRole,
      required this.createdAt,
      required this.updatedAt,
      required this.userAge,
      required this.nOfUpdate});

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileResponseModelToJson(this);
}

@JsonSerializable()
class UserProfileImage {
  final SecureProfileUrl profileImage;

  UserProfileImage({required this.profileImage});

  factory UserProfileImage.fromJson(Map<String, dynamic> json) =>
      _$UserProfileImageFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileImageToJson(this);
}

@JsonSerializable()
class SecureProfileUrl {
  @JsonKey(name: 'secure_url')
  final String secureProfileUrl;

  SecureProfileUrl({required this.secureProfileUrl});

  factory SecureProfileUrl.fromJson(Map<String, dynamic> json) =>
      _$SecureProfileUrlFromJson(json);

  Map<String, dynamic> toJson() => _$SecureProfileUrlToJson(this);
}
