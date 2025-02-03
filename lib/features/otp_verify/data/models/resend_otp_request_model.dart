import 'package:json_annotation/json_annotation.dart';

part 'resend_otp_request_model.g.dart';

@JsonSerializable()
class ResendOtpRequestModel {
  final String email;

  ResendOtpRequestModel({required this.email});

  factory ResendOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResendOtpRequestModelToJson(this);
}
