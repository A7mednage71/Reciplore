import 'package:json_annotation/json_annotation.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';

part 'get_recipes_response_model.g.dart';

@JsonSerializable()
class GetRecipesResponseModel {
  @JsonKey(name: 'recipes')
  final FetchedRecipesData fetchedRecipesData;

  GetRecipesResponseModel({required this.fetchedRecipesData});

  factory GetRecipesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetRecipesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetRecipesResponseModelToJson(this);
}

@JsonSerializable()
class FetchedRecipesData {
  @JsonKey(name: 'docs')
  final List<RecipeModel> recipesList;
  final int limit;
  final int page;
  final int totalPages;
  final bool hasNextPage;
  @JsonKey(name: 'totalDocs')
  final int recipesCount;

  FetchedRecipesData({
    required this.recipesList,
    required this.limit,
    required this.page,
    required this.totalPages,
    required this.hasNextPage,
    required this.recipesCount,
  });

  factory FetchedRecipesData.fromJson(Map<String, dynamic> json) =>
      _$FetchedRecipesDataFromJson(json);

  Map<String, dynamic> toJson() => _$FetchedRecipesDataToJson(this);
}

@JsonSerializable()
class RecipeModel {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String description;
  final String directions;
  final String? videoLink;
  final List<String> tags;
  final RecipeCategoryModel? category;
  final RecipeCountryModel? country;
  @JsonKey(name: 'Average_rating')
  final double averageRating;
  final int views;
  bool? isFavourite;
  final CreatedByModel createdBy;
  @JsonKey(name: 'Images')
  final RecipeImages images;
  final List<IngredientModel> ingredients;

  RecipeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.directions,
    required this.videoLink,
    required this.tags,
    required this.category,
    required this.country,
    required this.averageRating,
    required this.views,
    required this.isFavourite,
    required this.createdBy,
    required this.images,
    required this.ingredients,
  });

  RecipeModel copyWith({
    String? id,
    String? name,
    String? description,
    String? directions,
    String? videoLink,
    List<String>? tags,
    RecipeCategoryModel? category,
    RecipeCountryModel? country,
    double? averageRating,
    int? views,
    bool? isFavourite,
    CreatedByModel? createdBy,
    RecipeImages? images,
    List<IngredientModel>? ingredients,
  }) =>
      RecipeModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        directions: directions ?? this.directions,
        videoLink: videoLink ?? this.videoLink,
        tags: tags ?? this.tags,
        category: category ?? this.category,
        country: country ?? this.country,
        averageRating: averageRating ?? this.averageRating,
        views: views ?? this.views,
        isFavourite: isFavourite ?? this.isFavourite,
        createdBy: createdBy ?? this.createdBy,
        images: images ?? this.images,
        ingredients: ingredients ?? this.ingredients,
      );

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
}

@JsonSerializable()
class RecipeCategoryModel {
  @JsonKey(name: '_id')
  final String id;
  final String name;

  RecipeCategoryModel({required this.id, required this.name});

  factory RecipeCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeCategoryModelToJson(this);
}

@JsonSerializable()
class RecipeCountryModel {
  @JsonKey(name: '_id')
  final String id;
  final String name;

  RecipeCountryModel({required this.id, required this.name});

  factory RecipeCountryModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeCountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeCountryModelToJson(this);
}

@JsonSerializable()
class CreatedByModel {
  final String username;
  final ImageURL profileImage;

  CreatedByModel({required this.username, required this.profileImage});

  factory CreatedByModel.fromJson(Map<String, dynamic> json) =>
      _$CreatedByModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedByModelToJson(this);
}

@JsonSerializable()
class RecipeImages {
  @JsonKey(name: 'URLs')
  final List<ImageURL> urls;

  RecipeImages({required this.urls});

  factory RecipeImages.fromJson(Map<String, dynamic> json) =>
      _$RecipeImagesFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeImagesToJson(this);
}

@JsonSerializable()
class ImageURL {
  @JsonKey(name: 'secure_url')
  final String secureUrl;

  ImageURL({required this.secureUrl});

  factory ImageURL.fromJson(Map<String, dynamic> json) =>
      _$ImageURLFromJson(json);

  Map<String, dynamic> toJson() => _$ImageURLToJson(this);
}
