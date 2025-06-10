import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/change_password/presentation/cubit/change_password/change_password_cubit.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (successMessage) {
            ShowToast.showSuccessToast(successMessage);
            Navigator.pop(context);
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
              ),
            ),
          );
        }, orElse: () {
          return InkWell(
            onTap: () {
              _validateChangePassword(context);
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
                  "Change Password",
                  style: AppStyles.normalBoldWhiteText,
                ),
              ),
            ),
          );
        });
      },
    );
  }

  void _validateChangePassword(BuildContext context) {
    final changePassCubit = context.read<ChangePasswordCubit>();

    if (changePassCubit.formKey.currentState!.validate()) {
      changePassCubit.changePassword();
    }
  }
}
