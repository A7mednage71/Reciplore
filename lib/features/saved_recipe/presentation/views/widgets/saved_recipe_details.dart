import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/save_recipe_button.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class SavedRecipeDetails extends StatelessWidget {
  const SavedRecipeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'spice roasted chicken with flavored rice',
                style: AppStyles.smallBoldText.copyWith(
                  color: AppColors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5.h),
              Text('Category',
                  style: AppStyles.smallRegularText.copyWith(
                    color: AppColors.grayLight,
                  )),
              Text('Ribs',
                  style: AppStyles.smallRegularText
                      .copyWith(color: AppColors.white)),
            ],
          ),
        ),
        const Flexible(
          flex: 1,
          child: SaveRecipeButton(),
        ),
      ],
    );
  }
}
