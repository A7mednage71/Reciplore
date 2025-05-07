import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home/presentation/views/widgets/rating_stars.dart';
import 'package:looqma/features/market_ingredient_details/presentation/views/widgets/availability_badge.dart';
import 'package:looqma/features/reviews/data/models/review_screen_args.dart';
import 'package:lottie/lottie.dart';

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
                          style: AppStyles.mediumRegularGrayLightText),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                if (ingredient.discount.amount > 0)
                  Text("\$${ingredient.basePrice}",
                      style: AppStyles.smallRegularGrayLightText.copyWith(
                          decorationColor: AppColors.grayLight,
                          decoration: TextDecoration.lineThrough)),
              ],
            ),
            SizedBox(height: 15.h),
            AvailabilityBadge(isAvailable: ingredient.stock > 0),
            SizedBox(height: 12.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Description",
                    style: AppStyles.mediumRegularGrayLightText),
                SizedBox(width: 10.w),
                const Spacer(),
                Column(
                  children: [
                    RatingStars(rating: ingredient.averageRating),
                    SizedBox(width: 10.h),
                    TextButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all<EdgeInsets>(
                          EdgeInsets.zero,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.reviewScreen,
                            arguments:
                                ReviewScreenArgs(ingredientId: ingredient.id));
                      },
                      child: Text("(View Reviews)",
                          style: AppStyles.smallBoldprimarybrightText),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Visibility(
              visible: ingredient.description != null &&
                  ingredient.description!.isNotEmpty,
              child: Text(
                ingredient.description ?? '',
                style: AppStyles.smallRegularText,
              ),
            ),
            Center(
              child: Visibility(
                visible: ingredient.description == null ||
                    ingredient.description!.isEmpty,
                child: Lottie.asset(
                  AppAssets.imagesNoDataFound,
                  height: 150.h,
                  width: 150.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
