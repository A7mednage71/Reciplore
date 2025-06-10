import 'package:json_annotation/json_annotation.dart';

part 'search_recipe_with_ai_response_model.g.dart';

@JsonSerializable()
class SearchRecipeWithAiResponseModel {
  @JsonKey(name: 'enhancedRecipes')
  final List<EnhancedRecipe> recipes;

  SearchRecipeWithAiResponseModel({required this.recipes});

  factory SearchRecipeWithAiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchRecipeWithAiResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SearchRecipeWithAiResponseModelToJson(this);
}

@JsonSerializable()
class EnhancedRecipe {
  final EnhancedRecipeImage image;
  @JsonKey(name: 'recipeJson')
  final EnhancedRecipeData recipeData;

  EnhancedRecipe({required this.image, required this.recipeData});

  factory EnhancedRecipe.fromJson(Map<String, dynamic> json) =>
      _$EnhancedRecipeFromJson(json);

  Map<String, dynamic> toJson() => _$EnhancedRecipeToJson(this);
}

@JsonSerializable()
class EnhancedRecipeData {
  final String title;
  final String description;
  final EnhancedRecipeOverView overview;
  final List<EnhancedRecipeIngredient> ingredients;
  final List<EnhancedRecipeInstruction> instructions;
  final List<String> tipsAndVariations;
  final EnhancedRecipeNutrition? nutrition;

  EnhancedRecipeData({
    required this.title,
    required this.description,
    required this.overview,
    required this.ingredients,
    required this.instructions,
    required this.tipsAndVariations,
    required this.nutrition,
  });

  factory EnhancedRecipeData.fromJson(Map<String, dynamic> json) =>
      _$EnhancedRecipeDataFromJson(json);

  Map<String, dynamic> toJson() => _$EnhancedRecipeDataToJson(this);
}

@JsonSerializable()
class EnhancedRecipeOverView {
  final String? cuisine;
  final String? difficulty;
  final String? servings;
  final String? preptime;
  final String? cooktime;
  final String? totaltime;

  EnhancedRecipeOverView({
    required this.cuisine,
    required this.difficulty,
    required this.servings,
    required this.preptime,
    required this.cooktime,
    required this.totaltime,
  });

  factory EnhancedRecipeOverView.fromJson(Map<String, dynamic> json) =>
      _$EnhancedRecipeOverViewFromJson(json);

  Map<String, dynamic> toJson() => _$EnhancedRecipeOverViewToJson(this);
}

@JsonSerializable()
class EnhancedRecipeIngredient {
  final String name;
  final String quantity;
  final String? notes;

  EnhancedRecipeIngredient({
    required this.name,
    required this.quantity,
    required this.notes,
  });

  factory EnhancedRecipeIngredient.fromJson(Map<String, dynamic> json) =>
      _$EnhancedRecipeIngredientFromJson(json);

  Map<String, dynamic> toJson() => _$EnhancedRecipeIngredientToJson(this);
}

@JsonSerializable()
class EnhancedRecipeInstruction {
  final int step;
  final String action;
  final String? description;

  EnhancedRecipeInstruction({
    required this.step,
    required this.action,
    required this.description,
  });

  factory EnhancedRecipeInstruction.fromJson(Map<String, dynamic> json) =>
      _$EnhancedRecipeInstructionFromJson(json);

  Map<String, dynamic> toJson() => _$EnhancedRecipeInstructionToJson(this);
}

@JsonSerializable()
class EnhancedRecipeNutrition {
  final String? calories;
  final String? protein;
  final String? carbohydrates;
  final String? fat;

  EnhancedRecipeNutrition({
    required this.calories,
    required this.protein,
    required this.carbohydrates,
    required this.fat,
  });

  factory EnhancedRecipeNutrition.fromJson(Map<String, dynamic> json) =>
      _$EnhancedRecipeNutritionFromJson(json);

  Map<String, dynamic> toJson() => _$EnhancedRecipeNutritionToJson(this);
}

@JsonSerializable()
class EnhancedRecipeImage {
  final String imageUrl;

  EnhancedRecipeImage({required this.imageUrl});

  factory EnhancedRecipeImage.fromJson(Map<String, dynamic> json) =>
      _$EnhancedRecipeImageFromJson(json);

  Map<String, dynamic> toJson() => _$EnhancedRecipeImageToJson(this);
}
