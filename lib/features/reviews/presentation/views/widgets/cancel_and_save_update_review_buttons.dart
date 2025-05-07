import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/reviews/presentation/cubit/reviews_cubit/reviews_cubit.dart';

class CancelAndSaveUpdateReviewButtons extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  final String reviewId;

  const CancelAndSaveUpdateReviewButtons(
      {super.key, required this.formkey, required this.reviewId});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.secondaryDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            fixedSize: Size(80.w, 40.h),
          ),
          onPressed: () => context.pop(),
          child: Text("Cancel",
              style: AppStyles.extraSmallBoldText
                  .copyWith(color: AppColors.white)),
        ),
        SizedBox(width: 10.w),
        BlocBuilder<ReviewsCubit, ReviewsState>(
          buildWhen: (previous, current) =>
              previous.reviewActionStatus != current.reviewActionStatus &&
              current.currentAction == ReviewActionType.update,
          builder: (context, state) {
            if (state.reviewActionStatus == ReviewActionStatus.loading) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryDark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  fixedSize: Size(80.w, 40.h),
                ),
                onPressed: () {},
                child: Center(
                  child:
                      SpinKitFadingCircle(color: AppColors.white, size: 25.r),
                ),
              );
            } else {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryDark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  fixedSize: Size(80.w, 40.h),
                ),
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    await context.read<ReviewsCubit>().updateReview(reviewId);
                    if (context.mounted) {
                      context.pop();
                    }
                  }
                },
                child: Text("Save",
                    style: AppStyles.extraSmallBoldText
                        .copyWith(color: AppColors.white)),
              );
            }
          },
        ),
      ],
    );
  }
}
