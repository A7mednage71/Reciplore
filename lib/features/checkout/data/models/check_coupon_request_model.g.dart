// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_coupon_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckCouponRequestModel _$CheckCouponRequestModelFromJson(
        Map<String, dynamic> json) =>
    CheckCouponRequestModel(
      couponCode: json['couponCode'] as String,
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$CheckCouponRequestModelToJson(
        CheckCouponRequestModel instance) =>
    <String, dynamic>{
      'couponCode': instance.couponCode,
      'total': instance.total,
    };
