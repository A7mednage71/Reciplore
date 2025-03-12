import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/ingredient_details/presentation/views/widgets/quantity_and_add_to_cart.dart';

class IngredientContent extends StatelessWidget {
  const IngredientContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Fresh Carrot',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Rp 12,000",
                          style: AppStyles.smallRegularText
                              .copyWith(color: AppColors.successColor)),
                      TextSpan(
                          text: "/kg",
                          style: AppStyles.extraSmallRegularText
                              .copyWith(color: AppColors.grayLight)),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Text('Rp 21,000',
                    style: AppStyles.extraSmallRegularText.copyWith(
                        color: AppColors.grayLight,
                        decoration: TextDecoration.lineThrough)),
              ],
            ),
            SizedBox(height: 12.h),
            Center(
              child: Text("Description", style: AppStyles.mediumRegularText),
            ),
            const Divider(
              endIndent: 120,
              indent: 120,
              color: AppColors.primaryDark,
              height: 1.8,
            ),
            SizedBox(height: 12.h),
            const SizedBox(
              height: 100,
              child: Text(
                'The carrot is mofeed to nzr...',
                style: TextStyle(
                  height: 1.5,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const Spacer(),
            const QuantityAndAddToCart(),
          ],
        ),
      ),
    );
  }
}
