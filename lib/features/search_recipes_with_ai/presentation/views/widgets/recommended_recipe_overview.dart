import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/search_recipes_with_ai/data/models/search_recipe_with_ai_response_model.dart';

class RecommendedRecipeOverView extends StatelessWidget {
  const RecommendedRecipeOverView({
    super.key,
    required this.recipe,
  });

  final EnhancedRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Recipe Overview", style: AppStyles.mediumBoldText),
        SizedBox(height: 20.h),
        Container(
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
            color: AppColors.grayLighter,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text("cuisine", style: AppStyles.smallRegularText),
                    const Spacer(),
                    Text("${recipe.recipeData.overview.cuisine}",
                        style: AppStyles.smallRegularText),
                  ],
                ),
                Row(
                  children: [
                    Text("difficulty", style: AppStyles.smallRegularText),
                    const Spacer(),
                    Text("${recipe.recipeData.overview.difficulty}",
                        style: AppStyles.smallRegularText),
                  ],
                ),
                Row(
                  children: [
                    Text("servings", style: AppStyles.smallRegularText),
                    const Spacer(),
                    Text("${recipe.recipeData.overview.servings}",
                        style: AppStyles.smallRegularText),
                  ],
                ),
                Row(
                  children: [
                    Text("preptime", style: AppStyles.smallRegularText),
                    const Spacer(),
                    Text("${recipe.recipeData.overview.preptime}",
                        style: AppStyles.smallRegularText),
                  ],
                ),
                Row(
                  children: [
                    Text("cooktime", style: AppStyles.smallRegularText),
                    const Spacer(),
                    Text("${recipe.recipeData.overview.cooktime}",
                        style: AppStyles.smallRegularText),
                  ],
                ),
                const Divider(
                  color: AppColors.grayLight,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Text("Total Time", style: AppStyles.smallBoldText),
                    const Spacer(),
                    Text("${recipe.recipeData.overview.totaltime}",
                        style: AppStyles.smallBoldText),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
