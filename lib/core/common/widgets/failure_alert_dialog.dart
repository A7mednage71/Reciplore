import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/cancel_button.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:lottie/lottie.dart';

class FailureAlertDialog extends StatelessWidget {
  const FailureAlertDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onConfirmTitle,
    this.onConfirm,
  });

  final String title;
  final String subtitle;
  final String onConfirmTitle;
  final void Function()? onConfirm;

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
        style: AppStyles.smallBoldText,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            AppAssets.imagesFailureState,
            height: 100.h,
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: onConfirm,
                child: Text(onConfirmTitle,
                    style: AppStyles.extraSmallBoldprimaryDarkerText),
              ),
              const CancelButton()
            ],
          ),
        ],
      ),
    );
  }
}
