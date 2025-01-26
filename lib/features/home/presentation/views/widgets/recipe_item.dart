import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/save_recipe_button.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 176.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: AppColors.grayLighter,
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              children: [
                SizedBox(
                  height: 66.h,
                ),
                Text(
                  "Classic Greek Salad",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: AppStyles.smallBoldText,
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rate",
                          style: AppStyles.smallRegularText
                              .copyWith(color: AppColors.grayLight),
                        ),
                        Row(
                          children: [
                            Text(
                              "4.5 ",
                              style: AppStyles.smallRegularText,
                            ),
                            SizedBox(height: 5.h),
                            Image.asset(AppAssets.imagesRateStar)
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    const SaveRecipeButton()
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: -50.h,
          right: 17.w,
          child: Image.asset(
            AppAssets.imagesTestRecipe,
            height: 120.h,
            width: 120.w,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
