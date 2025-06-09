// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_coupon_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckCouponResponseModel _$CheckCouponResponseModelFromJson(
        Map<String, dynamic> json) =>
    CheckCouponResponseModel(
      totalAfterDiscount: (json['totalAfterDiscount'] as num).toInt(),
      couponId: json['couponId'] as String,
      discount: (json['discount'] as num).toInt(),
    );

Map<String, dynamic> _$CheckCouponResponseModelToJson(
        CheckCouponResponseModel instance) =>
    <String, dynamic>{
      'totalAfterDiscount': instance.totalAfterDiscount,
      'couponId': instance.couponId,
      'discount': instance.discount,
    };
