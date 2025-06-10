import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:lottie/lottie.dart';

void showPaymentResultDialog(
    {required BuildContext context, required bool isSuccess}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
          side: const BorderSide(color: AppColors.grayLight),
        ),
        title: Text(
          'Payment Process',
          style: AppStyles.mediumBoldText,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              isSuccess
                  ? AppAssets.imagesDoneCorrectly
                  : AppAssets.imagesFailureState,
              height: 100.h,
            ),
            SizedBox(height: 20.h),
            Text(
              isSuccess
                  ? "Your payment was completed successfully! 🎉"
                  : "Oops! Payment failed or was cancelled. ❌",
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
            child:
                Text('Done', style: AppStyles.extraSmallBoldprimaryDarkerText),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
