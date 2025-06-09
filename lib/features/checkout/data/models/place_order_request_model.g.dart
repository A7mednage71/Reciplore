// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderRequestModel _$PlaceOrderRequestModelFromJson(
        Map<String, dynamic> json) =>
    PlaceOrderRequestModel(
      shippingAddressID: json['shippingAddressID'] as String,
      contactNumber: json['contactNumber'] as String,
      paymentMethod: json['paymentMethod'] as String,
      couponCode: json['couponCode'] as String?,
    );

Map<String, dynamic> _$PlaceOrderRequestModelToJson(
        PlaceOrderRequestModel instance) =>
    <String, dynamic>{
      'shippingAddressID': instance.shippingAddressID,
      'contactNumber': instance.contactNumber,
      'paymentMethod': instance.paymentMethod,
      'couponCode': instance.couponCode,
    };
