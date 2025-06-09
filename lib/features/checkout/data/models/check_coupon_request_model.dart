import 'package:json_annotation/json_annotation.dart';

part 'check_coupon_request_model.g.dart';

@JsonSerializable()
class CheckCouponRequestModel {
  final String couponCode;
  final int total;

  CheckCouponRequestModel({
    required this.couponCode,
    required this.total,
  });

  factory CheckCouponRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CheckCouponRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckCouponRequestModelToJson(this);
}
