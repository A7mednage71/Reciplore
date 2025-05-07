import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/warning_alert_dailog.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/reviews/data/models/get_reviews_response_model.dart';
import 'package:looqma/features/reviews/presentation/cubit/reviews_cubit/reviews_cubit.dart';
import 'package:looqma/features/reviews/presentation/views/widgets/edit_review_bottom_sheet.dart';

class ReviewOptionsMenu extends StatelessWidget {
  const ReviewOptionsMenu({super.key, required this.review});
  final ReviewModel review;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReviewsCubit>();
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      icon: Icon(
        Icons.more_vert,
        color: AppColors.black,
        size: 24.r,
      ),
      color: AppColors.white,
      onSelected: (String value) {
        if (value == 'update') {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r))),
            builder: (context) => BlocProvider.value(
              value: cubit,
              child: EditReviewBottomSheet(review: review),
            ),
          );
        } else if (value == 'delete') {
          showDialog(
            context: context,
            builder: (context) => WarningAlertDailog(
              title: 'Delete Review',
              subtitle: 'Are you sure you want to delete Your review?',
              onOkPressed: () async {
                await cubit.deleteReview(review.id);
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
            ),
          );
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem(
          value: "update",
          child: Row(
            children: [
              Icon(
                Icons.edit_square,
                color: AppColors.black,
                size: 20.sp,
              ),
              SizedBox(width: 16.w),
              Text('Update', style: AppStyles.smallRegularText),
            ],
          ),
        ),
        PopupMenuItem(
          value: "delete",
          child: Row(
            children: [
              Icon(
                Icons.dangerous_outlined,
                color: AppColors.warningColor,
                size: 20.sp,
              ),
              SizedBox(width: 16.w),
              Text('Delete', style: AppStyles.smallRegularText),
            ],
          ),
        ),
      ],
    );
  }
}
