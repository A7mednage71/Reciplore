import 'package:json_annotation/json_annotation.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';

part 'verify_response_model.g.dart';

@JsonSerializable()
class VerifyResponseModel {
  final String message;
  final String accessToken;
  final String refreshToken;
  @JsonKey(name: '_id')
  final String userId;
  @JsonKey(name: 'username')
  final String userName;
  final ImageURL profileImage;

  factory VerifyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyResponseModelFromJson(json);

  VerifyResponseModel({
    required this.message,
    required this.accessToken,
    required this.refreshToken,
    required this.userId,
    required this.userName,
    required this.profileImage,
  });

  Map<String, dynamic> toJson() => _$VerifyResponseModelToJson(this);
}
