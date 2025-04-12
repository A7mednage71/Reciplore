import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:lottie/lottie.dart';

class FailureState extends StatelessWidget {
  const FailureState(
      {super.key, required this.hight, this.width, this.message});

  final double hight;
  final double? width;
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: hight + 60.h,
        width: width ?? double.infinity,
        child: Column(
          children: [
            Lottie.asset(
              AppAssets.imagesFailureState,
              height: hight,
              width: hight,
            ),
            SizedBox(height: 10.h),
            Text(message ?? 'Oops ,try again',
                style: AppStyles.smallBoldText
                    .copyWith(color: AppColors.secondaryDarker)),
          ],
        ),
      ),
    );
  }
}
