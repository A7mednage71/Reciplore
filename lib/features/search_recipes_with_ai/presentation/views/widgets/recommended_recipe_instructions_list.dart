import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/search_recipes_with_ai/data/models/search_recipe_with_ai_response_model.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/views/widgets/recommended_recipe_instruction_item.dart';

class RecommendedRecipeInstructionsList extends StatelessWidget {
  const RecommendedRecipeInstructionsList({
    super.key,
    required this.recipe,
  });

  final EnhancedRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Instructions", style: AppStyles.mediumBoldText),
        SizedBox(height: 20.h),
        Column(
          children: recipe.recipeData.instructions.asMap().entries.map((entry) {
            final instruction = entry.value;
            return RecommendedRecipeInstructionItem(instruction: instruction);
          }).toList(),
        ),
      ],
    );
  }
}
