// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ingredients_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetIngredientsResponseModel _$GetIngredientsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetIngredientsResponseModel(
      ingredients: FetchedIngredients.fromJson(
          json['ingredients'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetIngredientsResponseModelToJson(
        GetIngredientsResponseModel instance) =>
    <String, dynamic>{
      'ingredients': instance.ingredients,
    };

FetchedIngredients _$FetchedIngredientsFromJson(Map<String, dynamic> json) =>
    FetchedIngredients(
      ingredientsList: (json['docs'] as List<dynamic>)
          .map((e) => IngredientDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      limit: (json['limit'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      hasNextPage: json['hasNextPage'] as bool,
      ingredientsCount: (json['totalDocs'] as num).toInt(),
    );

Map<String, dynamic> _$FetchedIngredientsToJson(FetchedIngredients instance) =>
    <String, dynamic>{
      'docs': instance.ingredientsList,
      'limit': instance.limit,
      'page': instance.page,
      'totalPages': instance.totalPages,
      'hasNextPage': instance.hasNextPage,
      'totalDocs': instance.ingredientsCount,
    };
