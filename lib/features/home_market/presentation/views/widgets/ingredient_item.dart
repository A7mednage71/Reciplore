import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class MarketIngredientItem extends StatelessWidget {
  const MarketIngredientItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r)),
                image: const DecorationImage(
                    image: AssetImage(AppAssets.imagesRedChili),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Fresh Red Chili', style: AppStyles.smallBoldText),
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
                SizedBox(
                  height: 8.h,
                ),
                Text('Rp 14,000 ',
                    style: AppStyles.extraSmallRegularText.copyWith(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.grayLight,
                        color: AppColors.grayLight)),
                Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 5.r, bottom: 5.r),
                      child: Container(
                        width: 25.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primaryDark,
                            width: 1.8,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.add,
                            size: 20,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
