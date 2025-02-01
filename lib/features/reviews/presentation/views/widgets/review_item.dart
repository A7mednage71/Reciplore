import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home/presentation/views/widgets/rating_stars.dart';
import 'package:looqma/features/reviews/presentation/views/widgets/like_and_dislike.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.grayLighter,
              backgroundImage: const AssetImage(
                AppAssets.imagesUserProfile,
              ),
            ),
            SizedBox(width: 15.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ahmed Nageh',
                  style: AppStyles.extraSmallBoldText,
                ),
                Text('June 12, 2020 - 19:35',
                    style: AppStyles.extraSmallRegularText
                        .copyWith(color: AppColors.grayLight)),
              ],
            ),
            const Spacer(),
            const RatingStars(rating: 3)
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          'Lorem Ipsum tempor incididunt ut labore et dolore,inise voluptate velit esse cillum',
          style: AppStyles.smallRegularText.copyWith(color: AppColors.grayDark),
        ),
        const LikeAndDislike(),
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
