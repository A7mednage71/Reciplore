import 'package:json_annotation/json_annotation.dart';

part 'verify_response_model.g.dart';

@JsonSerializable()
class VerifyResponseModel {
  final String message;
  final String? token;

  VerifyResponseModel({required this.message, this.token});

  factory VerifyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResponseModelToJson(this);
}
