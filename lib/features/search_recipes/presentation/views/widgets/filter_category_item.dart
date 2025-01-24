import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class FilterCategoryItem extends StatelessWidget {
  const FilterCategoryItem(
      {super.key, required this.category, required this.isActive});
  final bool isActive;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      label: Text(category),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(
          color: isActive ? AppColors.primaryDark : AppColors.primaryDarker,
          width: 1.5,
        ),
      ),
      backgroundColor: isActive ? AppColors.primaryDark : Colors.white,
      labelStyle: AppStyles.smallRegularText
          .copyWith(color: isActive ? Colors.white : AppColors.primaryDarker),
    );
  }
}
