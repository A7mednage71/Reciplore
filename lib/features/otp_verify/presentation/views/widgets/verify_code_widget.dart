import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/otp_verify/presentation/cubit/verification_cubit/verification_cubit.dart';
import 'package:pinput/pinput.dart';

class VerifyCodeWidget extends StatelessWidget {
  const VerifyCodeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Pinput(
          controller: context.read<VerificationCubit>().otpController,
          length: 6,
          defaultPinTheme: PinTheme(
            width: 50.w,
            height: 50.h,
            textStyle: AppStyles.largeBoldText,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.grayLighter),
            ),
          ),
          focusedPinTheme: PinTheme(
            width: 55.w,
            height: 55.h,
            textStyle: AppStyles.largeRegularBlueText,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.primaryDarker),
            ),
          ),
          errorPinTheme: PinTheme(
            width: 50.w,
            height: 50.h,
            textStyle: AppStyles.largeRegularRedText,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
