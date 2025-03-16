import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class IngredientDetailsAddToCartButton extends StatelessWidget {
  const IngredientDetailsAddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDark,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        fixedSize: Size(double.maxFinite, 50.h),
      ),
      child: Text(
        'Add to Cart',
        style: AppStyles.smallBoldText.copyWith(color: AppColors.white),
      ),
    );
  }
}
