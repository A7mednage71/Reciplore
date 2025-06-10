import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/search_recipes_with_ai/data/models/search_recipe_with_ai_response_model.dart';

class RecommendedRecipeTipsAndVariations extends StatelessWidget {
  const RecommendedRecipeTipsAndVariations({
    super.key,
    required this.recipe,
  });

  final EnhancedRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Tips & Variations", style: AppStyles.mediumBoldText),
        SizedBox(height: 20.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: List.generate(
              recipe.recipeData.tipsAndVariations.length,
              (index) {
                final tip = recipe.recipeData.tipsAndVariations[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "• ",
                        style: AppStyles.mediumBoldText,
                      ),
                      Expanded(
                        child: Text(
                          tip,
                          style: AppStyles.smallRegularText,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Divider(
          thickness: 1.h,
          color: AppColors.grayMediumlight,
          indent: 20.w,
          endIndent: 20.w,
        )
      ],
    );
  }
}
