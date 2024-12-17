import 'package:json_annotation/json_annotation.dart';

part 'verify_request_model.g.dart';

@JsonSerializable()
class VerifyRequestModel {
  final String code;

  VerifyRequestModel({required this.code});

  factory VerifyRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyRequestModelToJson(this);
}
