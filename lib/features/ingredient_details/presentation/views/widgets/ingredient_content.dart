import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

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
          mainAxisSize: MainAxisSize.min,
          children: [
             Text(
              'Fresh Carrot',
              style: AppStyles.largeBoldText
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
                          text: "/ kg",
                          style: AppStyles.extraSmallRegularText
                              .copyWith(color: AppColors.grayLight)),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Text('Rp 21,000',
                    style: AppStyles.extraSmallRegularText.copyWith(
                        color: AppColors.grayLight,
                        decorationColor: AppColors.grayLight,
                        decoration: TextDecoration.lineThrough)),
              ],
            ),
            SizedBox(height: 15.h),
            Text("Description", style: AppStyles.mediumRegularText.copyWith(color: AppColors.grayLight)),
            SizedBox(height: 12.h),
            Text(
              'The carrot is mofeed to nzr...',
              style: AppStyles.smallRegularText,
            ),
          ],
        ),
      ),
    );
  }
}
