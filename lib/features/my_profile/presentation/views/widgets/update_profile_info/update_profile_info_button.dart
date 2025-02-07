import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/my_profile/presentation/cubit/update_user_profile/update_user_profile_cubit.dart';

class UpdateProfileInfoButton extends StatelessWidget {
  const UpdateProfileInfoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserProfileCubit, UpdateUserProfileState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (successMessage) {
            ShowToast.showSuccessToast(successMessage);
            Navigator.of(context).pop(true);
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
              validateUpdateUserProfile(context);
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
                  "Update info",
                  style: AppStyles.normalBoldText.copyWith(color: Colors.white),
                ),
              ),
            ),
          );
        });
      },
    );
  }

  void validateUpdateUserProfile(BuildContext context) {
    final cubit = context.read<UpdateUserProfileCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.updateUserProfile();
    }
  }
}
