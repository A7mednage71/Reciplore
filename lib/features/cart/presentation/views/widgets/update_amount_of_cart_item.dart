import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class UpdateAmountOfCartItem extends StatelessWidget {
  const UpdateAmountOfCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              border: Border.all(color: AppColors.primaryDarker, width: 1.5.w),
            ),
            child: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
        ),
        5.h.verticalSpace,
        Text(
          '1',
          style: AppStyles.smallBoldText,
        ),
        5.h.verticalSpace,
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              border: Border.all(color: AppColors.primaryDarker, width: 1.5.w),
            ),
            child: const Icon(
              Icons.remove,
              color: AppColors.primaryDark,
            ),
          ),
        ),
      ],
    );
  }
}
