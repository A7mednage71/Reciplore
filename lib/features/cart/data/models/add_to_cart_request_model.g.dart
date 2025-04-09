// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartRequestModel _$AddToCartRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddToCartRequestModel(
      ingredientId: json['ingredientId'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$AddToCartRequestModelToJson(
        AddToCartRequestModel instance) =>
    <String, dynamic>{
      'ingredientId': instance.ingredientId,
      'quantity': instance.quantity,
    };
