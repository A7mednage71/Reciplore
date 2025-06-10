import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/search_recipes_with_ai/data/models/search_recipe_with_ai_response_model.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/views/widgets/recommened_recipe_ingredient_item.dart';

class RecommenedRecipeIngredientsListView extends StatelessWidget {
  const RecommenedRecipeIngredientsListView({
    super.key,
    required this.recipe,
  });

  final EnhancedRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Ingredients", style: AppStyles.mediumBoldText),
        SizedBox(height: 20.h),
        Column(
          children: recipe.recipeData.ingredients.asMap().entries.map((entry) {
            final index = entry.key;
            final ingredient = entry.value;
            return RecommendedRecipeIngredientItem(
                ingredient: ingredient, index: index);
          }).toList(),
        ),
      ],
    );
  }
}
