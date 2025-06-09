import 'package:json_annotation/json_annotation.dart';

part 'update_user_info_request_model.g.dart';

@JsonSerializable()
class UpdateUserInfoRequestModel {
  final String name;
  final int age;
  final List<String> phoneNumbers;

  UpdateUserInfoRequestModel({
    required this.name,
    required this.age,
    required this.phoneNumbers,
  });

  factory UpdateUserInfoRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserInfoRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserInfoRequestModelToJson(this);
}
