import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/forget_password/presentation/cubit/forget_password_cubit.dart';

class ForgetPasswordResetButton extends StatelessWidget {
  const ForgetPasswordResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (successMessage) {
            ShowToast.showSuccessToast(successMessage);
            context.pop();
          },
          failure: (failureMessage) {
            ShowToast.showFailureToast(failureMessage);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(loading: () {
          return Container(
            width: double.infinity,
            height: 60.h,
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            )),
          );
        }, orElse: () {
          return InkWell(
            onTap: () {
              context.read<ForgetPasswordCubit>().forgetPassword();
            },
            child: Container(
              width: double.infinity,
              height: 60.h,
              decoration: BoxDecoration(
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Text(
                  "Reset Password",
                  style: AppStyles.normalBoldText.copyWith(color: Colors.white),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
