import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:looqma/core/common/widgets/empty_state.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/reviews/presentation/cubit/reviews_cubit/reviews_cubit.dart';
import 'package:looqma/features/reviews/presentation/views/widgets/review_item.dart';

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsState>(
      buildWhen: (previous, current) => previous.reviews != current.reviews,
      builder: (context, state) {
        if (state.status == ReviewsStatus.initial) {
          return const SizedBox.shrink();
        } else if (state.status == ReviewsStatus.loading) {
          return SizedBox(
            height: 300.h,
            child: Center(
              child:
                  SpinKitFadingCircle(color: AppColors.primaryDark, size: 60.r),
            ),
          );
        } else if (state.status == ReviewsStatus.failure) {
          return FailureState(hight: 60.h, message: state.message);
        } else if (state.reviews.isEmpty) {
          return const Center(child: EmptyState(message: 'No Reviews'));
        } else {
          return AnimationLimiter(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.reviews.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  child: SlideAnimation(
                    verticalOffset: 100.0,
                    child: FadeInAnimation(
                        child: ReviewItem(review: state.reviews[index])),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
