import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:lottie/lottie.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key, this.message, this.value});
  final String? message;
  final double? value;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Lottie.asset(
            AppAssets.imagesEmptyBox,
            height: value ?? 150.h,
            width: value ?? 200.w,
          ),
          Text(message ?? 'No Recipes Found',
              style: AppStyles.smallBoldText.copyWith(
                color: AppColors.secondaryDarker,
              )),
        ],
      ),
    );
  }
}
