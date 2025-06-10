// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cart_reponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCartReponseModel _$GetCartReponseModelFromJson(Map<String, dynamic> json) =>
    GetCartReponseModel(
      cart: json['cart'] == null
          ? null
          : CartDataModel.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCartReponseModelToJson(
        GetCartReponseModel instance) =>
    <String, dynamic>{
      'cart': instance.cart,
    };

CartDataModel _$CartDataModelFromJson(Map<String, dynamic> json) =>
    CartDataModel(
      cartId: json['_id'] as String,
      userID: json['userID'] as String,
      subTotal: (json['subTotal'] as num).toDouble(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => CartIngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartDataModelToJson(CartDataModel instance) =>
    <String, dynamic>{
      '_id': instance.cartId,
      'userID': instance.userID,
      'subTotal': instance.subTotal,
      'ingredients': instance.ingredients,
    };

CartIngredientModel _$CartIngredientModelFromJson(Map<String, dynamic> json) =>
    CartIngredientModel(
      cartIngredientId: json['_id'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      ingredient: IngredientDataModel.fromJson(
          json['IngredientID'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartIngredientModelToJson(
        CartIngredientModel instance) =>
    <String, dynamic>{
      '_id': instance.cartIngredientId,
      'quantity': instance.quantity,
      'price': instance.price,
      'IngredientID': instance.ingredient,
    };
