import 'package:flutter/material.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/search_recipes_with_ai/data/models/search_recipe_with_ai_response_model.dart';

class CustomInstructionDescriptionRichText extends StatelessWidget {
  const CustomInstructionDescriptionRichText({
    super.key,
    required this.instruction,
  });

  final EnhancedRecipeInstruction instruction;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "• ",
            style: AppStyles.smallRegularGrayMediumText,
          ),
          TextSpan(
            text: "Description :  ",
            style: AppStyles.smallBoldText,
          ),
          TextSpan(
            text: instruction.description ?? "",
            style: AppStyles.smallRegularGrayMediumText,
          ),
        ],
      ),
    );
  }
}
