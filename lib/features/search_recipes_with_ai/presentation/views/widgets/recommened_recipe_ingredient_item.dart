import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/search_recipes_with_ai/data/models/search_recipe_with_ai_response_model.dart';

class RecommendedRecipeIngredientItem extends StatelessWidget {
  const RecommendedRecipeIngredientItem({
    super.key,
    required this.ingredient,
    required this.index,
  });

  final EnhancedRecipeIngredient ingredient;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryMedium),
              color: AppColors.grayLighter,
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              child: Text(
                "• ${ingredient.quantity} ${ingredient.name} ${ingredient.notes ?? ""}",
                style: AppStyles.smallRegularGrayMediumText,
              ),
            ),
          ),
          Positioned(
            top: -7.h,
            left: -7.w,
            child: CircleAvatar(
              backgroundColor: AppColors.primaryDarker,
              radius: 12.r,
              child: Text(
                "${index + 1}",
                style: AppStyles.smallBoldWhiteText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
