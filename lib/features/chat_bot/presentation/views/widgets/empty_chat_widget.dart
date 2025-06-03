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
        children: [
          Lottie.asset(
            AppAssets.imagesCookingAnimation,
            height: 300.h,
            width: double.infinity,
            backgroundLoading: false,
          ),
          Text("👋 Let’s cooking!", style: AppStyles.mediumBoldText),
          SizedBox(height: 20.h),
          Text(
            "1) Write what you have in mind✨ below 👇\n"
            "2) Hit Send and let’s cook up something tasty! 🍽️",
            style: AppStyles.smallRegularText,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
