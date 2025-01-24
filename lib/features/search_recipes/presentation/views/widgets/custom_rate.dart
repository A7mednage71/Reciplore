import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class CustomRate extends StatelessWidget {
  const CustomRate({super.key, required this.rate});

  final String rate;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 45.w,
        height: 16.h,
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.secondaryLighter,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: AppColors.ratingColor,
              size: 10.w,
            ),
            SizedBox(width: 3.w),
            Text(
              rate,
              style: AppStyles.extraSmallRegularText,
            ),
          ],
        ),
      ),
    );
  }
}
