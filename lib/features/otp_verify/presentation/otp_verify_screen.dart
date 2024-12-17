import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_back_arrow_app_bar.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/otp_verify/presentation/widgets/confirm_code_button.dart';
import 'package:looqma/features/otp_verify/presentation/widgets/verify_code_widget.dart';
import 'package:lottie/lottie.dart';

class OtpVerifyScreen extends StatelessWidget {
  const OtpVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustombackArrowAppbar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Center(
                child: Lottie.asset(
                  AppAssets.imagesVerify,
                  height: 200.h,
                ),
              ),
              SizedBox(height: 50.h),
              Text(
                "Verification Code",
                style: AppStyles.largeBoldText,
              ),
              Text(
                "Enter the code sent to your Email Address",
                style: AppStyles.smallRegularText,
              ),
              SizedBox(height: 20.h),
              const VerifyCodeWidget(),
              SizedBox(height: 20.h),
              const ConfirmCodeButton(),
            ],
          ),
        ));
  }
}
