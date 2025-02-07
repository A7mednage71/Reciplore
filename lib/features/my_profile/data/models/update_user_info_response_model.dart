import 'package:json_annotation/json_annotation.dart';

part 'update_user_info_response_model.g.dart';

@JsonSerializable()
class UpdateUserinfoResponseModel {
  UpdateUserinfoResponseModel({
    required this.message,
  });

  final String message;

  factory UpdateUserinfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserinfoResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserinfoResponseModelToJson(this);
}
