import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:lottie/lottie.dart';

class DietPlanCreatedSuccessDialog extends StatelessWidget {
  const DietPlanCreatedSuccessDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
        side: const BorderSide(color: AppColors.grayLight),
      ),
      title: Text(
        'Diet Plan',
        style: AppStyles.mediumBoldText,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            AppAssets.imagesDoneCorrectly,
            height: 100.h,
          ),
          SizedBox(height: 20.h),
          Text(
            "Your data was saved successfully! and your plan will be sent to your email 🎉",
            style: AppStyles.smallRegularText,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.grayLighter,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: const BorderSide(color: AppColors.grayLight),
            ),
          ),
          child: Text('Done', style: AppStyles.extraSmallBoldprimaryDarkerText),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
