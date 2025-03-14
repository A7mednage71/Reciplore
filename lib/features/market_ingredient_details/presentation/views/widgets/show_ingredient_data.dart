import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home/presentation/views/widgets/rating_stars.dart';
import 'package:looqma/features/market_ingredient_details/presentation/views/widgets/availability_badge.dart';

class ShowIngredientData extends StatelessWidget {
  const ShowIngredientData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text('Fresh Carrot', style: AppStyles.largeBoldText),
            SizedBox(height: 10.h),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Rp 12,000",
                          style: AppStyles.largeBoldText
                              .copyWith(color: AppColors.primaryMoreLight)),
                      TextSpan(
                          text: " / kg",
                          style: AppStyles.mediumRegularText
                              .copyWith(color: AppColors.grayLight)),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Text('Rp 21,000',
                    style: AppStyles.smallRegularText.copyWith(
                        color: AppColors.grayLight,
                        decorationColor: AppColors.grayLight,
                        decoration: TextDecoration.lineThrough)),
              ],
            ),
            SizedBox(height: 15.h),
            const AvailabilityBadge(isAvailable: true),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Description",
                    style: AppStyles.mediumRegularText
                        .copyWith(color: AppColors.grayLight)),
                const RatingStars(rating: 3),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
                'A fresh carrot is a vibrant orange root vegetable known for its crisp texture and sweet flavor. Rich in vitamins, particularly vitamin A, and antioxidants, it is commonly eaten raw, cooked, or juiced. Carrots are widely used in salads, soups, and snacks',
                style: AppStyles.smallRegularText),
          ],
        ),
      ),
    );
  }
}
