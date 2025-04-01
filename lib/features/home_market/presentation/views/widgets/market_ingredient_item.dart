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
    return SizedBox(
      width: 150.w,
      height: 250.h,
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
                        topRight: Radius.circular(10.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${ingredient.discount.amount.toInt()} %',
                        style: AppStyles.extraSmallRegularText
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.primaryDarker,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(10.r),
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
                            style: AppStyles.smallBoldText
                                .copyWith(color: AppColors.primarybright)),
                        TextSpan(
                            text: "/ kg",
                            style: AppStyles.extraSmallRegularText
                                .copyWith(color: AppColors.grayLight)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    ingredient.discount.amount > 0
                        ? "\$${ingredient.basePrice}"
                        : "",
                    style: AppStyles.smallRegularText.copyWith(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColors.grayLight,
                      color: AppColors.grayLight,
                    ),
                  ),
                  const Align(
                      alignment: Alignment.topRight,
                      child: AddIngredientToCartHomeButton()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
