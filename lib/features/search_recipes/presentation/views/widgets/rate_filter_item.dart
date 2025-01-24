import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class RateFilterItem extends StatelessWidget {
  const RateFilterItem(
      {super.key, required this.isActive, required this.rateValue});
  final bool isActive;
  final int rateValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.h,
      width: 51.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: isActive ? AppColors.primaryDark : Colors.white,
        border: Border.all(
            color: isActive ? AppColors.primaryDark : AppColors.primaryDarker,
            width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$rateValue",
            style: AppStyles.smallRegularText.copyWith(
                color: isActive ? Colors.white : AppColors.primaryDarker),
          ),
          SizedBox(width: 3.w),
          Icon(
            Icons.star,
            color: isActive ? Colors.white : AppColors.primaryDarker,
            size: 20,
          )
        ],
      ),
    );
  }
}
