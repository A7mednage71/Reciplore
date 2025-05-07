import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/reviews/presentation/cubit/reviews_cubit/reviews_cubit.dart';

class SendReviewButton extends StatelessWidget {
  const SendReviewButton({
    super.key,
    required this.formKey,
  });
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: BlocConsumer<ReviewsCubit, ReviewsState>(
        listenWhen: (previous, current) =>
            previous.reviewActionStatus != current.reviewActionStatus &&
            current.reviewActionStatus == ReviewActionStatus.failure,
        listener: (context, state) {
          ShowToast.showFailureToast(state.message ?? '');
        },
        buildWhen: (previous, current) =>
            previous.reviewActionStatus != current.reviewActionStatus &&
            current.currentAction == ReviewActionType.add,
        builder: (context, state) {
          if (state.reviewActionStatus == ReviewActionStatus.loading) {
            return Container(
              height: 40.h,
              width: 60.w,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              child: Center(
                child: SpinKitFadingCircle(color: AppColors.white, size: 20.r),
              ),
            );
          } else {
            return InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  context.read<ReviewsCubit>().addReview();
                }
              },
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              child: Container(
                height: 40.h,
                width: 60.w,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColors.primaryDark,
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                child: Center(
                  child: Text(
                    'Send',
                    style: AppStyles.smallRegularText
                        .copyWith(color: AppColors.white),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
