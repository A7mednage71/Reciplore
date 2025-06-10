// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_recipes_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRecipesResponseModel _$GetRecipesResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetRecipesResponseModel(
      fetchedRecipesData:
          FetchedRecipesData.fromJson(json['recipes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetRecipesResponseModelToJson(
        GetRecipesResponseModel instance) =>
    <String, dynamic>{
      'recipes': instance.fetchedRecipesData,
    };

FetchedRecipesData _$FetchedRecipesDataFromJson(Map<String, dynamic> json) =>
    FetchedRecipesData(
      recipesList: (json['docs'] as List<dynamic>)
          .map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      limit: (json['limit'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      hasNextPage: json['hasNextPage'] as bool,
      recipesCount: (json['totalDocs'] as num).toInt(),
    );

Map<String, dynamic> _$FetchedRecipesDataToJson(FetchedRecipesData instance) =>
    <String, dynamic>{
      'docs': instance.recipesList,
      'limit': instance.limit,
      'page': instance.page,
      'totalPages': instance.totalPages,
      'hasNextPage': instance.hasNextPage,
      'totalDocs': instance.recipesCount,
    };

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => RecipeModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      directions: json['directions'] as String,
      videoLink: json['videoLink'] as String?,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      category: json['category'] == null
          ? null
          : RecipeCategoryModel.fromJson(
              json['category'] as Map<String, dynamic>),
      country: json['country'] == null
          ? null
          : RecipeCountryModel.fromJson(
              json['country'] as Map<String, dynamic>),
      averageRating: (json['Average_rating'] as num).toDouble(),
      views: (json['views'] as num).toInt(),
      isFavourite: json['isFavourite'] as bool?,
      createdBy:
          CreatedByModel.fromJson(json['createdBy'] as Map<String, dynamic>),
      images: RecipeImages.fromJson(json['Images'] as Map<String, dynamic>),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeModelToJson(RecipeModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'directions': instance.directions,
      'videoLink': instance.videoLink,
      'tags': instance.tags,
      'category': instance.category,
      'country': instance.country,
      'Average_rating': instance.averageRating,
      'views': instance.views,
      'isFavourite': instance.isFavourite,
      'createdBy': instance.createdBy,
      'Images': instance.images,
      'ingredients': instance.ingredients,
    };

RecipeCategoryModel _$RecipeCategoryModelFromJson(Map<String, dynamic> json) =>
    RecipeCategoryModel(
      id: json['_id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$RecipeCategoryModelToJson(
        RecipeCategoryModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };

RecipeCountryModel _$RecipeCountryModelFromJson(Map<String, dynamic> json) =>
    RecipeCountryModel(
      id: json['_id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$RecipeCountryModelToJson(RecipeCountryModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };

CreatedByModel _$CreatedByModelFromJson(Map<String, dynamic> json) =>
    CreatedByModel(
      username: json['username'] as String,
      profileImage:
          ImageURL.fromJson(json['profileImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreatedByModelToJson(CreatedByModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'profileImage': instance.profileImage,
    };

RecipeImages _$RecipeImagesFromJson(Map<String, dynamic> json) => RecipeImages(
      urls: (json['URLs'] as List<dynamic>)
          .map((e) => ImageURL.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeImagesToJson(RecipeImages instance) =>
    <String, dynamic>{
      'URLs': instance.urls,
    };

ImageURL _$ImageURLFromJson(Map<String, dynamic> json) => ImageURL(
      secureUrl: json['secure_url'] as String,
    );

Map<String, dynamic> _$ImageURLToJson(ImageURL instance) => <String, dynamic>{
      'secure_url': instance.secureUrl,
    };
