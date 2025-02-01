import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/on_boarding/widgets/start_cooking_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imagesOnboardingBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 104.h),
            Image.asset(
              AppAssets.imagesOnboardingTopLogo,
            ),
            SizedBox(height: 14.h),
            Text("100K+ Premium Recipe ",
                style: AppStyles.mediumBoldText.copyWith(color: Colors.white)),
            SizedBox(height: 222.h),
            Text(
              'Let’s',
              style: AppStyles.titleBoldText.copyWith(color: Colors.white),
            ),
            Text(
              'Cooking',
              style: AppStyles.titleBoldText.copyWith(color: Colors.white),
            ),
            Text(
              'Simple way to find Tasty Recipe',
              style: AppStyles.normalBoldText.copyWith(color: Colors.white),
            ),
            SizedBox(height: 64.h),
            const StartCookingButton(),
          ],
        ),
      ),
    );
  }
}
