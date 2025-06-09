// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_overview_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartOverviewResponseModel _$CartOverviewResponseModelFromJson(
        Map<String, dynamic> json) =>
    CartOverviewResponseModel(
      couponId: json['couponId'] as String?,
      shippingFee: (json['shippingFee'] as num).toInt(),
      vatAmount: (json['vatAmount'] as num).toInt(),
      coupondiscount: (json['coupondiscount'] as num).toInt(),
      subTotal: (json['subTotal'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      addresses: (json['addresses'] as List<dynamic>)
          .map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartOverviewResponseModelToJson(
        CartOverviewResponseModel instance) =>
    <String, dynamic>{
      'couponId': instance.couponId,
      'shippingFee': instance.shippingFee,
      'vatAmount': instance.vatAmount,
      'coupondiscount': instance.coupondiscount,
      'subTotal': instance.subTotal,
      'total': instance.total,
      'addresses': instance.addresses,
    };
