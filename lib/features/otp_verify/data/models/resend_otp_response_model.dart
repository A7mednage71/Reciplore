import 'package:json_annotation/json_annotation.dart';

part 'resend_otp_response_model.g.dart';

@JsonSerializable()
class ResendOtpResponseModel {
  final String message;

  ResendOtpResponseModel({required this.message});

  factory ResendOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResendOtpResponseModelToJson(this);
}
