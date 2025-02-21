import 'package:json_annotation/json_annotation.dart';
import 'package:looqma/features/home/data/models/all_categories_model.dart';
import 'package:looqma/features/home/data/models/all_countries_model.dart';

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
  final String slug;
  final String description;
  final String directions;
  final String videoLink;
  final List<String> tags;
  final CategoryModel category;
  final CountryModel country;
  @JsonKey(name: 'Average_Rating')
  final double averageRating;
  final int views;
  @JsonKey(name: 'Images')
  final RecipeImages images;
  final List<IngredientModel> ingredients;

  RecipeModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.images,
    required this.ingredients,
    required this.tags,
    required this.category,
    required this.country,
    required this.averageRating,
    required this.views,
    required this.videoLink,
    required this.directions,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
}

@JsonSerializable()
class RecipeImages {
  @JsonKey(name: 'URLs')
  final List<ImageURL> urls;
  final String customID;

  RecipeImages({required this.urls, required this.customID});

  factory RecipeImages.fromJson(Map<String, dynamic> json) =>
      _$RecipeImagesFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeImagesToJson(this);
}

@JsonSerializable()
class ImageURL {
  @JsonKey(name: 'secure_url')
  final String secureUrl;
  @JsonKey(name: 'public_id')
  final String publicId;
  @JsonKey(name: '_id')
  final String? id;

  ImageURL({required this.secureUrl, required this.publicId, required this.id});

  factory ImageURL.fromJson(Map<String, dynamic> json) =>
      _$ImageURLFromJson(json);

  Map<String, dynamic> toJson() => _$ImageURLToJson(this);
}

@JsonSerializable()
class IngredientModel {
  final IngredientDataModel ingredientData;
  final String amount;

  IngredientModel({required this.ingredientData, required this.amount});

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientModelFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientModelToJson(this);
}

@JsonSerializable()
class IngredientDataModel {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String slug;
  final double basePrice;
  final double appliedPrice;
  final int stock;
  @JsonKey(name: 'Average_Rating')
  final double averageRating;
  final Discount discount;
  final ImageURL image;

  IngredientDataModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.basePrice,
    required this.appliedPrice,
    required this.stock,
    required this.averageRating,
    required this.discount,
    required this.image,
  });

  factory IngredientDataModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientDataModelToJson(this);
}

@JsonSerializable()
class Discount {
  final double amount;
  final String type;

  Discount({required this.amount, required this.type});

  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountToJson(this);
}
