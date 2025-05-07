import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:lottie/lottie.dart';

class EmptyReviews extends StatelessWidget {
  const EmptyReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppAssets.imagesReviewLottie,
              height: 200.h,
              width: 200.w,
            ),
            SizedBox(height: 20.h),
            Text(
              "🧐 No reviews found!\nDrop your opinion and help others 💬",
              style: AppStyles.smallBoldText.copyWith(
                color: AppColors.secondaryDarker,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
