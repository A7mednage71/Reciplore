import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:lottie/lottie.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Text("Ooops!", style: AppStyles.headerBoldText),
          Text('No Internet Connection',
              style: AppStyles.mediumBoldText
                  .copyWith(color: AppColors.secondaryDarker)),
          SizedBox(height: 50.h),
          Lottie.asset(AppAssets.imagesNoInternet),
          SizedBox(height: 50.h),
          Text(
            'Please check your internet connection and try again.',
            style: AppStyles.mediumRegularText,
          ),
          const Spacer(),
          Text('© 2024 looqma. All rights reserved.',
              style: AppStyles.smallRegularText)
        ],
      ),
    ));
  }
}
