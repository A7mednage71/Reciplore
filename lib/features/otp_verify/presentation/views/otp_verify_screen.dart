import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_back_arrow_app_bar.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/otp_verify/presentation/cubit/resend_otp/resend_otp_cubit.dart';
import 'package:looqma/features/otp_verify/presentation/cubit/verification_cubit/verification_cubit.dart';
import 'package:looqma/features/otp_verify/presentation/views/widgets/confirm_code_button.dart';
import 'package:looqma/features/otp_verify/presentation/views/widgets/verify_code_widget.dart';
import 'package:lottie/lottie.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key, required this.email});
  final String email;
  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  int _seconds = 60;
  Timer? _timer;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    _timer?.cancel();
    _seconds = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustombackArrowAppbar(),
        body: SingleChildScrollView(
          child: Padding(
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
                if (_seconds > 0)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Resend code available in $_seconds sec",
                      style: AppStyles.extraSmallRegularText,
                    ),
                  ),
                if (_seconds == 0)
                  Align(
                    alignment: Alignment.centerRight,
                    child: BlocListener<ResendOtpCubit, ResendOtpState>(
                      listener: (context, state) {
                        state.mapOrNull(
                          success: (successMessage) {
                            ShowToast.showSuccessToast(
                                successMessage.successMessage);
                          },
                          failure: (failureMessage) {
                            ShowToast.showFailureToast(
                                failureMessage.errorMessage);
                          },
                        );
                      },
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context
                              .read<VerificationCubit>()
                              .otpController
                              .clear();
                          context.read<ResendOtpCubit>().email = widget.email;
                          await context.read<ResendOtpCubit>().resendOtp();
                          startTimer();
                        },
                        child: Text(
                          "Resend Code",
                          style: AppStyles.smallRegularText
                              .copyWith(color: AppColors.secondaryDark),
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: 10.h),
                const ConfirmCodeButton(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ));
  }
}
