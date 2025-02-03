import 'package:json_annotation/json_annotation.dart';

part 'upload_profile_image_model.g.dart';

@JsonSerializable()
class UploadProfileImageModel {
  UploadProfileImageModel({required this.message});

  factory UploadProfileImageModel.fromJson(Map<String, dynamic> json) =>
      _$UploadProfileImageModelFromJson(json);
  final String message;
}
