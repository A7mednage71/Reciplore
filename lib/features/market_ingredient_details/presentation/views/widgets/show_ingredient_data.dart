import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home/presentation/views/widgets/rating_stars.dart';
import 'package:looqma/features/market_ingredient_details/presentation/views/widgets/availability_badge.dart';

class ShowIngredientData extends StatelessWidget {
  const ShowIngredientData({super.key, required this.ingredient});
  final IngredientDataModel ingredient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(ingredient.name, style: AppStyles.largeBoldText),
            SizedBox(height: 10.h),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "\$${ingredient.appliedPrice}",
                          style: AppStyles.largeBoldText
                              .copyWith(color: AppColors.primarybright)),
                      TextSpan(
                          text: " / kg",
                          style: AppStyles.mediumRegularText
                              .copyWith(color: AppColors.grayLight)),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                if (ingredient.discount.amount > 0)
                  Text("\$${ingredient.basePrice}",
                      style: AppStyles.smallRegularText.copyWith(
                          color: AppColors.grayLight,
                          decorationColor: AppColors.grayLight,
                          decoration: TextDecoration.lineThrough)),
              ],
            ),
            SizedBox(height: 15.h),
            AvailabilityBadge(isAvailable: ingredient.stock > 0),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Description",
                    style: AppStyles.mediumRegularText
                        .copyWith(color: AppColors.grayLight)),
                RatingStars(rating: ingredient.averageRating),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              ingredient.description ?? "",
              style: AppStyles.smallRegularText,
            ),
          ],
        ),
      ),
    );
  }
}
