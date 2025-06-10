import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/diet_plan/presentation/cubit/diet_plan_cubit.dart';
import 'package:looqma/features/diet_plan/presentation/cubit/diet_plan_state.dart';
import 'package:looqma/features/diet_plan/presentation/views/widgets/diet_plan_created_success_dialog.dart';

class CreatePlanButton extends StatelessWidget {
  const CreatePlanButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dietPlanCubit = context.read<DietPlanCubit>();
    return BlocConsumer<DietPlanCubit, DietPlanState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == DietPlanStatus.success) {
          showDialog(
            context: context,
            builder: (context) => const DietPlanCreatedSuccessDialog(),
          );
        } else if (state.status == DietPlanStatus.failure) {
          ShowToast.showFailureToast(state.message ?? '');
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == DietPlanStatus.loading) {
          return Container(
            width: double.infinity,
            height: 60.h,
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: SpinKitFadingCircle(color: AppColors.white, size: 30.r),
            ),
          );
        } else {
          return InkWell(
            onTap: () async {
              if (dietPlanCubit.formKey.currentState!.validate()) {
                if (dietPlanCubit.state.gender == null) {
                  ShowToast.showFailureToast('Please select your gender');
                  return;
                }
                if (dietPlanCubit.state.goal == null) {
                  ShowToast.showFailureToast('Please select your goal');
                  return;
                }
                await dietPlanCubit.createDietPlan();
              }
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
                  "Create Plan",
                  style: AppStyles.mediumBoldWhiteText,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
