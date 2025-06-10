import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/login/presentation/cubit/login_cubit.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.mapOrNull(
          success: (message) {
            String email = context.read<LoginCubit>().emailController.text;
            ShowToast.showSuccessToast(message.successMessage);
            context.pushNamed(Routes.verification, arguments: email);
          },
          error: (message) {
            ShowToast.showFailureToast(message.errorMessage);
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
                  child: CircularProgressIndicator(
                color: Colors.white,
              )),
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
                    "Sign In",
                    style: AppStyles.normalBoldWhiteText,
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
    final cubit = context.read<LoginCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.login();
    }
  }
}
