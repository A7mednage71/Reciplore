import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class IngredientQuantity extends StatelessWidget {
  const IngredientQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30.w,
          height: 30.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryDarker,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: InkWell(
            onTap: () {},
            child: Icon(
              Icons.remove,
              size: 20.r,
              color: AppColors.primaryDarker,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Text('2',
                style: AppStyles.mediumBoldText
                    .copyWith(color: AppColors.primaryDarker)),
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          width: 30.w,
          height: 30.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryDarker,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            onTap: () {},
            child: Icon(
              Icons.add,
              size: 20.r,
              color: AppColors.primaryDarker,
            ),
          ),
        ),
      ],
    );
  }
}
