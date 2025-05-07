import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/reviews/presentation/views/widgets/rate_and_share_opinion.dart';
import 'package:looqma/features/reviews/presentation/views/widgets/reviews_list_view.dart';

class UsersReview extends StatelessWidget {
  const UsersReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Reviews'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  '200 reviews',
                  style: AppStyles.smallRegularText.copyWith(
                    color: AppColors.grayLight,
                  ),
                ),
              ),
              SizedBox(height: 7.h),
              const RateAndShareOpinion(),
              SizedBox(height: 20.h),
              const ReviewsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
