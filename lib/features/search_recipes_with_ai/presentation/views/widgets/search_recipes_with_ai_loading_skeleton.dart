import 'package:flutter/material.dart';
import 'package:looqma/core/utils/app_constants.dart';
import 'package:looqma/features/search_recipes_with_ai/data/models/search_recipe_with_ai_response_model.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/views/widgets/search_recipes_with_ai_result_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchRecipeWithAiResultLoadingSkeleton extends StatelessWidget {
  const SearchRecipeWithAiResultLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    List<EnhancedRecipe> recipes = List.generate(
      10,
      (index) => EnhancedRecipe(
        image:
            EnhancedRecipeImage(imageUrl: AppConstants.defaultRecipeItemImage),
        recipeData: EnhancedRecipeData(
          title: "title title",
          description: "description",
          overview: EnhancedRecipeOverView(
              cuisine: "cuisine",
              difficulty: "difficulty",
              servings: "servings",
              preptime: "prepTime",
              cooktime: "cookTime",
              totaltime: "totalTime"),
          ingredients: List.generate(
            2,
            (index) {
              return EnhancedRecipeIngredient(
                name: "name",
                quantity: "2",
                notes: "notes",
              );
            },
          ),
          instructions: List.generate(
            2,
            (index) {
              return EnhancedRecipeInstruction(
                step: 2,
                action: "action",
                description: "description",
              );
            },
          ),
          tipsAndVariations: List.generate(2, (index) {
            return "tip";
          }),
          nutrition: EnhancedRecipeNutrition(
            calories: "0g",
            fat: "0g",
            carbohydrates: "18-25g",
            protein: "0g",
          ),
        ),
      ),
    );
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
      ),
      child: SearchRecipeWithAiResultGridView(
        recipes: recipes,
      ),
    );
  }
}
