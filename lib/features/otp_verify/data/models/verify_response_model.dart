import 'package:json_annotation/json_annotation.dart';

part 'verify_response_model.g.dart';

@JsonSerializable()
class VerifyResponseModel {
  final String message;
  final String accessToken;
  final String refreshToken;

  factory VerifyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyResponseModelFromJson(json);

  VerifyResponseModel(
      {required this.message,
      required this.accessToken,
      required this.refreshToken});

  Map<String, dynamic> toJson() => _$VerifyResponseModelToJson(this);
}
