import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/forget_password/presentation/widgets/forget_password_email_field.dart';
import 'package:looqma/features/forget_password/presentation/widgets/forget_password_reset_button.dart';
import 'package:lottie/lottie.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Center(
                child: Lottie.asset(
                  AppAssets.imagesForgetPassword,
                  height: 250.h,
                ),
              ),
              SizedBox(height: 50.h),
              Text(
                'Forget Password',
                style: AppStyles.largeBoldText,
              ),
              SizedBox(height: 10.h),
              Text(
                'Enter your email address and we will send you a link to reset your password.',
                style: AppStyles.smallRegularText,
              ),
              SizedBox(height: 20.h),
              const ForgetPasswordEmailField(),
              SizedBox(height: 20.h),
              const ForgetPasswordResetButton()
            ],
          ),
        ),
      ),
    );
  }
}
