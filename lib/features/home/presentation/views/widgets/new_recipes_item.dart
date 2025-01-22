import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home/presentation/views/widgets/rating_stars.dart';

class NewRecipesItem extends StatelessWidget {
  const NewRecipesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 120.h,
        width: 251.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pilaf sweet with lamb-and-raisins",
                      style: AppStyles.smallBoldText,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    const RatingStars(rating: 4.5),
                    SizedBox(height: 10.h),
                    Text("Category",
                        style: AppStyles.smallRegularText
                            .copyWith(color: AppColors.grayLighter)),
                    Text("sweets", style: AppStyles.normalRegularText),
                  ],
                ),
              ),
              Image.asset(
                AppAssets.imagesTestRecipe,
                height: 110.h,
                width: 80.w,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }
}
