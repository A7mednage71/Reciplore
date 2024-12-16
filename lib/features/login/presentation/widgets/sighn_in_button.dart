import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Text(
          "Sign In",
          style: AppStyles.normalBoldText.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
