import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/sigh_up/presentation/cubit/sighn_up_cubit.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SighnUpCubit, SighnUpState>(
      listener: (context, state) {
        state.whenOrNull(
          failure: (errorMessage) {
            ShowToast.showFailureToast(errorMessage);
          },
          success: (successMessage) {
            ShowToast.showSuccessToast(
                '$successMessage, \nA verification link has been sent to your email.');
            context.pushReplacementNamed(Routes.login);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return Container(
              width: double.infinity,
              height: 60.h,
              decoration: BoxDecoration(
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            );
          },
          orElse: () {
            return InkWell(
              onTap: () {
                validate(context);
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
                    "Sign Up",
                    style: AppStyles.mediumBoldWhiteText,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void validate(BuildContext context) {
    final cubit = context.read<SighnUpCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.signUp();
    }
  }
}
