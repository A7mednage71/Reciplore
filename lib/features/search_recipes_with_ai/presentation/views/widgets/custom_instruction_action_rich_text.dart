import 'package:flutter/material.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/search_recipes_with_ai/data/models/search_recipe_with_ai_response_model.dart';

class CusotmInstructionActionRichText extends StatelessWidget {
  const CusotmInstructionActionRichText({
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
            text: "Action :  ",
            style: AppStyles.smallBoldText,
          ),
          TextSpan(
            text: instruction.action,
            style: AppStyles.smallRegularGrayMediumText,
          ),
        ],
      ),
    );
  }
}
