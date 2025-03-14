import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';

class AddIngredientToCartHomeButton extends StatelessWidget {
  const AddIngredientToCartHomeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 30.w,
        height: 30.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryDark,
            width: 1.8,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            size: 25.r,
            color: AppColors.primaryDark,
          ),
        ),
      ),
    );
  }
}
