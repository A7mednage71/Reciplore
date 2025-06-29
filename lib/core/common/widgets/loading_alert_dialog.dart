import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class LoadingAlertDialog extends StatelessWidget {
  const LoadingAlertDialog({
    super.key,
    required this.title,
    required this.subtitle,
    this.onCancel,
  });

  final String title;
  final String subtitle;
  final void Function()? onCancel;

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
            SizedBox(height: 10.h),
            SpinKitPouringHourGlassRefined(
                color: AppColors.secondaryDarker, size: 100.r),
            SizedBox(height: 20.h),
            Text(subtitle, style: AppStyles.smallRegularText),
          ],
        ),
        actions: [
          TextButton(
            onPressed: onCancel ?? () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: AppStyles.extraSmallBoldprimaryDarkerText,
            ),
          ),
        ]);
  }
}
