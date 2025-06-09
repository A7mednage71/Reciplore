// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_recipe_with_ai_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRecipeWithAiResponseModel _$SearchRecipeWithAiResponseModelFromJson(
        Map<String, dynamic> json) =>
    SearchRecipeWithAiResponseModel(
      recipes: (json['enhancedRecipes'] as List<dynamic>)
          .map((e) => EnhancedRecipe.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchRecipeWithAiResponseModelToJson(
        SearchRecipeWithAiResponseModel instance) =>
    <String, dynamic>{
      'enhancedRecipes': instance.recipes,
    };

EnhancedRecipe _$EnhancedRecipeFromJson(Map<String, dynamic> json) =>
    EnhancedRecipe(
      image:
          EnhancedRecipeImage.fromJson(json['image'] as Map<String, dynamic>),
      recipeData: EnhancedRecipeData.fromJson(
          json['recipeJson'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EnhancedRecipeToJson(EnhancedRecipe instance) =>
    <String, dynamic>{
      'image': instance.image,
      'recipeJson': instance.recipeData,
    };

EnhancedRecipeData _$EnhancedRecipeDataFromJson(Map<String, dynamic> json) =>
    EnhancedRecipeData(
      title: json['title'] as String,
      description: json['description'] as String,
      overview: EnhancedRecipeOverView.fromJson(
          json['overview'] as Map<String, dynamic>),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) =>
              EnhancedRecipeIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      instructions: (json['instructions'] as List<dynamic>)
          .map((e) =>
              EnhancedRecipeInstruction.fromJson(e as Map<String, dynamic>))
          .toList(),
      tipsAndVariations: (json['tipsAndVariations'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      nutrition: EnhancedRecipeNutrition.fromJson(
          json['nutrition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EnhancedRecipeDataToJson(EnhancedRecipeData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'overview': instance.overview,
      'ingredients': instance.ingredients,
      'instructions': instance.instructions,
      'tipsAndVariations': instance.tipsAndVariations,
      'nutrition': instance.nutrition,
    };

EnhancedRecipeOverView _$EnhancedRecipeOverViewFromJson(
        Map<String, dynamic> json) =>
    EnhancedRecipeOverView(
      cuisine: json['cuisine'] as String,
      difficulty: json['difficulty'] as String,
      servings: json['servings'] as String,
      prepTime: json['prepTime'] as String,
      cookTime: json['cookTime'] as String,
      totalTime: json['totalTime'] as String,
    );

Map<String, dynamic> _$EnhancedRecipeOverViewToJson(
        EnhancedRecipeOverView instance) =>
    <String, dynamic>{
      'cuisine': instance.cuisine,
      'difficulty': instance.difficulty,
      'servings': instance.servings,
      'prepTime': instance.prepTime,
      'cookTime': instance.cookTime,
      'totalTime': instance.totalTime,
    };

EnhancedRecipeIngredient _$EnhancedRecipeIngredientFromJson(
        Map<String, dynamic> json) =>
    EnhancedRecipeIngredient(
      name: json['name'] as String,
      quantity: json['quantity'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$EnhancedRecipeIngredientToJson(
        EnhancedRecipeIngredient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'notes': instance.notes,
    };

EnhancedRecipeInstruction _$EnhancedRecipeInstructionFromJson(
        Map<String, dynamic> json) =>
    EnhancedRecipeInstruction(
      step: json['step'] as String,
      action: json['action'] as String,
    );

Map<String, dynamic> _$EnhancedRecipeInstructionToJson(
        EnhancedRecipeInstruction instance) =>
    <String, dynamic>{
      'step': instance.step,
      'action': instance.action,
    };

EnhancedRecipeNutrition _$EnhancedRecipeNutritionFromJson(
        Map<String, dynamic> json) =>
    EnhancedRecipeNutrition(
      calories: json['calories'] as String,
      protein: json['protein'] as String,
      carbohydrates: json['carbohydrates'] as String,
      fat: json['fat'] as String,
    );

Map<String, dynamic> _$EnhancedRecipeNutritionToJson(
        EnhancedRecipeNutrition instance) =>
    <String, dynamic>{
      'calories': instance.calories,
      'protein': instance.protein,
      'carbohydrates': instance.carbohydrates,
      'fat': instance.fat,
    };

EnhancedRecipeImage _$EnhancedRecipeImageFromJson(Map<String, dynamic> json) =>
    EnhancedRecipeImage(
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$EnhancedRecipeImageToJson(
        EnhancedRecipeImage instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
    };
