// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderResponseModel _$PlaceOrderResponseModelFromJson(
        Map<String, dynamic> json) =>
    PlaceOrderResponseModel(
      order: OrderModel.fromJson(json['order'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$PlaceOrderResponseModelToJson(
        PlaceOrderResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'order': instance.order,
    };

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      subTotal: (json['subTotal'] as num).toDouble(),
      total: (json['total'] as num).toInt(),
      fromCart: json['fromCart'] as bool,
      paymentMethod: json['paymentMethod'] as String,
      orderStatus: json['orderStatus'] as String,
      orderedAt: json['orderedAt'] as String,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'subTotal': instance.subTotal,
      'total': instance.total,
      'fromCart': instance.fromCart,
      'paymentMethod': instance.paymentMethod,
      'orderStatus': instance.orderStatus,
      'orderedAt': instance.orderedAt,
    };
