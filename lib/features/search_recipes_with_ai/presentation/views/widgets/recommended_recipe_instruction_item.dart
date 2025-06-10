import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/search_recipes_with_ai/data/models/search_recipe_with_ai_response_model.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/views/widgets/custom_instruction_action_rich_text.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/views/widgets/custom_instruction_description_richtext.dart';

class RecommendedRecipeInstructionItem extends StatelessWidget {
  const RecommendedRecipeInstructionItem({
    super.key,
    required this.instruction,
  });

  final EnhancedRecipeInstruction instruction;

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CusotmInstructionActionRichText(instruction: instruction),
                  CustomInstructionDescriptionRichText(
                      instruction: instruction),
                ],
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
                "${instruction.step}",
                style: AppStyles.smallBoldWhiteText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
