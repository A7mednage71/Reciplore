import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/search_recipes_with_ai/data/models/search_recipe_with_ai_response_model.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/views/widgets/custom_nutritional_listTile.dart';

class RecommendedRecipeNutriationalInformation extends StatelessWidget {
  const RecommendedRecipeNutriationalInformation({
    super.key,
    required this.recipe,
  });

  final EnhancedRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Nutritional Information", style: AppStyles.mediumBoldText),
        SizedBox(height: 20.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              CustomNutritionalListTile(
                title: "Calories",
                trailing: recipe.recipeData.nutrition?.calories,
              ),
              SizedBox(height: 10.h),
              CustomNutritionalListTile(
                title: "Protein",
                trailing: recipe.recipeData.nutrition?.protein,
              ),
              SizedBox(height: 10.h),
              CustomNutritionalListTile(
                title: "Fat",
                trailing: recipe.recipeData.nutrition?.fat,
              ),
              SizedBox(height: 10.h),
              CustomNutritionalListTile(
                title: "Carbs",
                trailing: recipe.recipeData.nutrition?.carbohydrates,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.r),
          child: Text(
            "Note: Nutritional information is an estimate and may vary depending on the specific ingredients used.",
            style: AppStyles.smallRegularText
                .copyWith(fontStyle: FontStyle.italic),
          ),
        ),
      ],
    );
  }
}
