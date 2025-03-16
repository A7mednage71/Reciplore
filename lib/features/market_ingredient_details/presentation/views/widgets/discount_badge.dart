import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class DiscountBadge extends StatelessWidget {
  final int discountPercentage;

  const DiscountBadge({super.key, required this.discountPercentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.local_offer, color: AppColors.white, size: 18.r),
          SizedBox(width: 4.w),
          Text(
            '$discountPercentage% OFF',
            style: AppStyles.smallRegularText.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
