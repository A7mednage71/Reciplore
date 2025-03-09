import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_response_model.g.dart';

@JsonSerializable()
class RefreshTokenResponseModel {
  final String message;
  final String accessToken;
  final String refreshToken;

  RefreshTokenResponseModel({
    required this.message,
    required this.accessToken,
    required this.refreshToken,
  });

  factory RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenResponseModelToJson(this);
}
