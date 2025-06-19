// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_orders_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrdersResponseModel _$GetOrdersResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetOrdersResponseModel(
      orders: (json['orders'] as List<dynamic>)
          .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetOrdersResponseModelToJson(
        GetOrdersResponseModel instance) =>
    <String, dynamic>{
      'orders': instance.orders,
    };

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      subTotal: (json['subTotal'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      paymentMethod: json['paymentMethod'] as String,
      orderStatus: json['orderStatus'] as String,
      shippingAddress: json['shippingAddress'] as String,
      orderedAt: json['orderedAt'] as String,
      estimatedDeliveryDate: json['estimatedDeliveryDate'] as String,
      orderIngredients: (json['orderIngredients'] as List<dynamic>)
          .map((e) => OrderIngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'subTotal': instance.subTotal,
      'total': instance.total,
      'paymentMethod': instance.paymentMethod,
      'orderStatus': instance.orderStatus,
      'shippingAddress': instance.shippingAddress,
      'orderedAt': instance.orderedAt,
      'estimatedDeliveryDate': instance.estimatedDeliveryDate,
      'orderIngredients': instance.orderIngredients,
    };

OrderIngredientModel _$OrderIngredientModelFromJson(
        Map<String, dynamic> json) =>
    OrderIngredientModel(
      orderIngredientId: json['_id'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      ingredientData: IngredientDataModel.fromJson(
          json['ingredientId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderIngredientModelToJson(
        OrderIngredientModel instance) =>
    <String, dynamic>{
      '_id': instance.orderIngredientId,
      'quantity': instance.quantity,
      'price': instance.price,
      'ingredientId': instance.ingredientData,
    };
