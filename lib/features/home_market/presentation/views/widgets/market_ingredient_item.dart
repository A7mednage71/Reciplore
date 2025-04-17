import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/add_ingeredient_to_cart_home_button.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/ingredient_cached_image.dart';

class MarketIngredientItem extends StatelessWidget {
  const MarketIngredientItem({super.key, required this.ingredient});
  final IngredientDataModel ingredient;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 250.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primaryDarker, width: 1.5.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              IngredientCachedImage(image: ingredient.image.secureUrl),
              if (ingredient.discount.amount > 0)
                Positioned(
                  top: 0.h,
                  right: 0.w,
                  child: Container(
                    height: 20.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${ingredient.discount.amount.toInt()} %',
                        style: AppStyles.extraSmallRegularWhiteText,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ingredient.name,
                      style: AppStyles.smallBoldText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.h),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "\$${ingredient.appliedPrice}",
                              style: AppStyles.smallBoldprimarybrightText),
                          TextSpan(
                              text: "/ kg",
                              style: AppStyles.extraSmallRegularGrayLightText),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      ingredient.discount.amount > 0
                          ? "\$${ingredient.basePrice}"
                          : "",
                      style: AppStyles.smallRegularGrayLightText.copyWith(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.grayLight,
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: AddIngredientToCartHomeButton(
                            ingredient: ingredient)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
