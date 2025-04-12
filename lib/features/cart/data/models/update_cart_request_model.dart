import 'package:json_annotation/json_annotation.dart';

part 'update_cart_request_model.g.dart';

@JsonSerializable()
class UpdateCartRequestModel {
  final int quantity;

  UpdateCartRequestModel({
    required this.quantity,
  });

  factory UpdateCartRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateCartRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCartRequestModelToJson(this);
}
