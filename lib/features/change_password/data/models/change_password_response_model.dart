import 'package:json_annotation/json_annotation.dart';

part 'change_password_response_model.g.dart';

@JsonSerializable()
class ChangePasswordResponseModel {
  final String message;

  ChangePasswordResponseModel({required this.message});

  factory ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordResponseModelToJson(this);
}
