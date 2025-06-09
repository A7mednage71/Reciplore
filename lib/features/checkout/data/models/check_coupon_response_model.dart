import 'package:json_annotation/json_annotation.dart';

part 'check_coupon_response_model.g.dart';

@JsonSerializable()
class CheckCouponResponseModel {
  final int totalAfterDiscount;
  final String couponId;
  final int discount;

  CheckCouponResponseModel({
    required this.totalAfterDiscount,
    required this.couponId,
    required this.discount,
  });

  factory CheckCouponResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CheckCouponResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckCouponResponseModelToJson(this);
}
