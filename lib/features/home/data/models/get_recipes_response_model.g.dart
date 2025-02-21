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
      slug: json['slug'] as String,
      description: json['description'] as String,
      images: RecipeImages.fromJson(json['Images'] as Map<String, dynamic>),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      category:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      country: CountryModel.fromJson(json['country'] as Map<String, dynamic>),
      averageRating: (json['Average_Rating'] as num).toDouble(),
      views: (json['views'] as num).toInt(),
      videoLink: json['videoLink'] as String,
      directions: json['directions'] as String,
    );

Map<String, dynamic> _$RecipeModelToJson(RecipeModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'directions': instance.directions,
      'videoLink': instance.videoLink,
      'tags': instance.tags,
      'category': instance.category,
      'country': instance.country,
      'Average_Rating': instance.averageRating,
      'views': instance.views,
      'Images': instance.images,
      'ingredients': instance.ingredients,
    };

RecipeImages _$RecipeImagesFromJson(Map<String, dynamic> json) => RecipeImages(
      urls: (json['URLs'] as List<dynamic>)
          .map((e) => ImageURL.fromJson(e as Map<String, dynamic>))
          .toList(),
      customID: json['customID'] as String,
    );

Map<String, dynamic> _$RecipeImagesToJson(RecipeImages instance) =>
    <String, dynamic>{
      'URLs': instance.urls,
      'customID': instance.customID,
    };

ImageURL _$ImageURLFromJson(Map<String, dynamic> json) => ImageURL(
      secureUrl: json['secure_url'] as String,
      publicId: json['public_id'] as String,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$ImageURLToJson(ImageURL instance) => <String, dynamic>{
      'secure_url': instance.secureUrl,
      'public_id': instance.publicId,
      '_id': instance.id,
    };

IngredientModel _$IngredientModelFromJson(Map<String, dynamic> json) =>
    IngredientModel(
      ingredientData: IngredientDataModel.fromJson(
          json['ingredientData'] as Map<String, dynamic>),
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$IngredientModelToJson(IngredientModel instance) =>
    <String, dynamic>{
      'ingredientData': instance.ingredientData,
      'amount': instance.amount,
    };

IngredientDataModel _$IngredientDataModelFromJson(Map<String, dynamic> json) =>
    IngredientDataModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      basePrice: (json['basePrice'] as num).toDouble(),
      appliedPrice: (json['appliedPrice'] as num).toDouble(),
      stock: (json['stock'] as num).toInt(),
      averageRating: (json['Average_Rating'] as num).toDouble(),
      discount: Discount.fromJson(json['discount'] as Map<String, dynamic>),
      image: ImageURL.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IngredientDataModelToJson(
        IngredientDataModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'basePrice': instance.basePrice,
      'appliedPrice': instance.appliedPrice,
      'stock': instance.stock,
      'Average_Rating': instance.averageRating,
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
