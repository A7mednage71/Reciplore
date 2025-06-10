// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_recipe_with_ai_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRecipeWithAiRequestModel _$SearchRecipeWithAiRequestModelFromJson(
        Map<String, dynamic> json) =>
    SearchRecipeWithAiRequestModel(
      ingredients: json['ingredients'] as String,
      start: (json['start'] as num).toInt(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$SearchRecipeWithAiRequestModelToJson(
        SearchRecipeWithAiRequestModel instance) =>
    <String, dynamic>{
      'ingredients': instance.ingredients,
      'start': instance.start,
      'count': instance.count,
    };
