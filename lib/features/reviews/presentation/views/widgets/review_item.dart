import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/cached_network_circle_avatar.dart';
import 'package:looqma/core/extensions/string_ex.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home/presentation/views/widgets/rating_stars.dart';
import 'package:looqma/features/reviews/data/models/get_reviews_response_model.dart';
import 'package:looqma/features/reviews/presentation/views/widgets/like_and_dislike.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.review});
  final ReviewModel review;
  @override
  Widget build(BuildContext context) {
    log(review.createdAt);
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
                    style: AppStyles.extraSmallRegularText
                        .copyWith(color: AppColors.grayLight)),
              ],
            ),
            const Spacer(),
            RatingStars(rating: review.rate.toDouble())
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          review.comment,
          style: AppStyles.smallRegularText.copyWith(color: AppColors.grayDark),
        ),
        LikeAndDislike(
            dislike: review.dislikes.length, like: review.likes.length),
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
