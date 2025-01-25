import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:lottie/lottie.dart';

class EmptyChatWidget extends StatelessWidget {
  const EmptyChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50.h),
          Lottie.asset(
            AppAssets.imagesEmptyChatLottie,
            height: 200.h,
            width: double.infinity,
          ),
          SizedBox(height: 20.h),
          Text(
            "How can I help you..?",
            style: AppStyles.mediumRegularText,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
