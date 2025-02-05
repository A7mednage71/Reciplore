import 'package:json_annotation/json_annotation.dart';

part 'delete_profile_image_model.g.dart';
@JsonSerializable()
class DeleteProfileImageModel {
  DeleteProfileImageModel({required this.message});
  final String message;

  factory DeleteProfileImageModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteProfileImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteProfileImageModelToJson(this);
}
