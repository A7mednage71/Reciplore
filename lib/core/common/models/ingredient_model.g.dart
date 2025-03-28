// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientModel _$IngredientModelFromJson(Map<String, dynamic> json) =>
    IngredientModel(
      ingredientData: IngredientDataModel.fromJson(
          json['ingredient'] as Map<String, dynamic>),
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$IngredientModelToJson(IngredientModel instance) =>
    <String, dynamic>{
      'ingredient': instance.ingredientData,
      'amount': instance.amount,
    };

IngredientDataModel _$IngredientDataModelFromJson(Map<String, dynamic> json) =>
    IngredientDataModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      basePrice: (json['basePrice'] as num).toDouble(),
      appliedPrice: (json['appliedPrice'] as num).toDouble(),
      stock: (json['stock'] as num).toInt(),
      averageRating: (json['Average_rating'] as num).toDouble(),
      discount: Discount.fromJson(json['discount'] as Map<String, dynamic>),
      image: ImageURL.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IngredientDataModelToJson(
        IngredientDataModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'basePrice': instance.basePrice,
      'appliedPrice': instance.appliedPrice,
      'stock': instance.stock,
      'Average_rating': instance.averageRating,
      'discount': instance.discount,
      'image': instance.image,
    };

Discount _$DiscountFromJson(Map<String, dynamic> json) => Discount(
      amount: (json['amount'] as num).toDouble(),
      type: json['type'] as String,
    );

Map<String, dynamic> _$DiscountToJson(Discount instance) => <String, dynamic>{
      'amount': instance.amount,
      'type': instance.type,
    };
