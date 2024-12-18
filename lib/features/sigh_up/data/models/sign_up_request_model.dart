import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_model.g.dart';

@JsonSerializable()
class SignUpRequestModel {
  final String name;
  final String email;
  final String password;
  final List<String> phoneNumbers;
  final String confirmPassword;

  SignUpRequestModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.phoneNumbers,
      required this.confirmPassword});

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
}
