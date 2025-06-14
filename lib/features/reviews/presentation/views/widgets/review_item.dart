import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/cached_network_circle_avatar.dart';
import 'package:looqma/core/extensions/string_ex.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home/presentation/views/widgets/rating_stars.dart';
import 'package:looqma/features/reviews/data/models/get_reviews_response_model.dart';
import 'package:looqma/features/reviews/presentation/cubit/reviews_cubit/reviews_cubit.dart';
import 'package:looqma/features/reviews/presentation/views/widgets/like_and_dislike.dart';
import 'package:looqma/features/reviews/presentation/views/widgets/review_options_speed_dial.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.review});
  final ReviewModel review;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CachedNetworkCircleAvatar(
              radius: 20.r,
              image: review.user.profileImage.secureUrl,
            ),
            SizedBox(width: 15.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.user.userName.capitalizeEachWord,
                  style: AppStyles.extraSmallBoldText,
                ),
                Text(review.createdAt.formatDate,
                    style: AppStyles.extraSmallRegularGrayLightText),
              ],
            ),
            const Spacer(),
            RatingStars(rating: review.rate.toDouble()),
            SizedBox(width: 10.w),
            Visibility(
                visible: review.user.id ==
                    context.read<ReviewsCubit>().state.currentUserId,
                child: ReviewOptionsSpeedDial(review: review)),
            Visibility(
              visible: review.user.id !=
                  context.read<ReviewsCubit>().state.currentUserId,
              child: const Spacer(),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          review.comment ?? '',
          style: AppStyles.smallRegularGrayDarkText,
        ),
        LikeAndDislike(review: review),
        Divider(
          color: AppColors.grayLighter,
          thickness: 1.h,
          indent: 20.w,
          endIndent: 20.w,
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
