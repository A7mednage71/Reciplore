import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class DietPlanGoalChip extends StatelessWidget {
  const DietPlanGoalChip(
      {super.key, required this.goal, required this.isActive});
  final bool isActive;
  final String goal;
  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      label: Text(goal),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(
          color: isActive ? AppColors.primaryDark : AppColors.primaryDarker,
          width: 1.5,
        ),
      ),
      backgroundColor: isActive ? AppColors.primaryDark : AppColors.white,
      labelStyle: isActive
          ? AppStyles.smallRegularWhiteText
          : AppStyles.smallRegularPrimaryDarkerText,
    );
  }
}
