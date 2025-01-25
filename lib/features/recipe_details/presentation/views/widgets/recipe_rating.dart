import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class RecipeRating extends StatelessWidget {
  const RecipeRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: AppColors.secondaryLighter,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star,
              color: AppColors.secondaryDarker,
              size: 16.sp,
            ),
            SizedBox(width: 4.w),
            Text(
                '4.5',
                style: AppStyles.smallRegularText
            ),
          ],
        ),
      ),
    );;
  }
}
