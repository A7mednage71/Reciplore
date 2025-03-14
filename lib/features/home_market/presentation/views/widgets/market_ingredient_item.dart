import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/add_ingeredient_to_cart_home_button.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/ingredient_cached_image.dart';

class MarketIngredientItem extends StatelessWidget {
  const MarketIngredientItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const IngredientCachedImage(),
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
                Text('Fresh Red Chili', style: AppStyles.smallBoldText),
                SizedBox(height: 8.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Rp 12,000",
                          style: AppStyles.smallRegularText
                              .copyWith(color: AppColors.primaryMoreLight)),
                      TextSpan(
                          text: "/ kg",
                          style: AppStyles.extraSmallRegularText
                              .copyWith(color: AppColors.grayLight)),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Rp 14,000 ',
                  style: AppStyles.extraSmallRegularText.copyWith(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: AppColors.grayLight,
                    color: AppColors.grayLight,
                  ),
                ),
                SizedBox(height: 10.h),
                const Align(
                    alignment: Alignment.topRight,
                    child: AddIngredientToCartHomeButton()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
