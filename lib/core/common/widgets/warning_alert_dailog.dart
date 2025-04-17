import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:lottie/lottie.dart';

class WarningAlertDailog extends StatelessWidget {
  const WarningAlertDailog({
    super.key,
    required this.title,
    required this.subtitle,
    this.onOkPressed,
  });

  final String title;
  final String subtitle;
  final void Function()? onOkPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
          side: const BorderSide(color: AppColors.grayLight),
        ),
        title: Text(
          title,
          style: AppStyles.mediumBoldText,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              AppAssets.imagesWorningLottie,
              height: 100.h,
            ),
            Text(subtitle, style: AppStyles.smallRegularText),
          ],
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: AppStyles.extraSmallBoldprimaryDarkerText,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            onPressed: onOkPressed,
            child: Text(
              'Delete',
              style: AppStyles.extraSmallBoldWarningText,
            ),
          )
        ]);
  }
}
