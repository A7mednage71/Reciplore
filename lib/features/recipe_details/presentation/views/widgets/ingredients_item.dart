import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class IngredientsItem extends StatelessWidget {
  const IngredientsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: double.infinity,
        height: 76.h,
        decoration: BoxDecoration(
          color: AppColors.grayLighter,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Container(
                width: 52.w,
                height: 52.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  image: DecorationImage(
                    image: AssetImage(AppAssets.ingredient),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Text(
              "Tomato",
              style: AppStyles.normalBoldText,
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: Text(
                "500g",
                style: AppStyles.smallRegularText
                    .copyWith(color: AppColors.grayLight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
