import 'package:json_annotation/json_annotation.dart';
import 'package:looqma/features/checkout/data/models/address_model.dart';

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
  final List<AddressModel> userAddresses;

  @JsonKey(name: 'role')
  final String userRole;

  final String createdAt;
  final String updatedAt;

  @JsonKey(name: 'age')
  final int? userAge;

  @JsonKey(name: '__v')
  final int nOfUpdate;

  UserProfileResponseModel({
    required this.userId,
    required this.userName,
    required this.profileImage,
    required this.email,
    required this.phoneNumbers,
    required this.userAddresses,
    required this.userRole,
    required this.createdAt,
    required this.updatedAt,
    this.userAge,
    required this.nOfUpdate,
  });

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileResponseModelToJson(this);
}

@JsonSerializable()
class UserProfileImage {
  @JsonKey(name: 'secure_url')
  final String? secureProfileUrl;

  UserProfileImage({this.secureProfileUrl});

  factory UserProfileImage.fromJson(Map<String, dynamic> json) =>
      _$UserProfileImageFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileImageToJson(this);
}
