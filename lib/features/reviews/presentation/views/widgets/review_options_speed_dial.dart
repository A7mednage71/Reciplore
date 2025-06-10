import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:looqma/core/common/widgets/warning_alert_dailog.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/reviews/data/models/get_reviews_response_model.dart';
import 'package:looqma/features/reviews/presentation/cubit/reviews_cubit/reviews_cubit.dart';
import 'package:looqma/features/reviews/presentation/views/widgets/edit_review_bottom_sheet.dart';

class ReviewOptionsSpeedDial extends StatelessWidget {
  const ReviewOptionsSpeedDial({
    super.key,
    required this.review,
  });
  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReviewsCubit>();
    return SpeedDial(
      icon: Icons.more_vert,
      backgroundColor: Colors.transparent,
      activeIcon: Icons.close,
      activeBackgroundColor: AppColors.primaryLight,
      elevation: 0,
      overlayOpacity: 0.5,
      overlayColor: AppColors.grayLight,
      spacing: 10,
      buttonSize: const Size(50, 50),
      animationCurve: Curves.easeInOutBack,
      animationDuration: const Duration(milliseconds: 300),
      children: [
        SpeedDialChild(
          child: const Icon(Icons.mode_edit_outline, color: AppColors.white),
          label: 'Edit',
          labelStyle: AppStyles.smallRegularText,
          backgroundColor: AppColors.primaryDarker,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          onTap: () {
            showEditReviewBottomSheet(context, cubit);
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.delete_outline, color: AppColors.white),
          label: 'Delete',
          labelStyle: AppStyles.smallRegularText,
          backgroundColor: AppColors.red,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          onTap: () {
            showDeleteReviewDialog(context, cubit);
          },
        ),
      ],
    );
  }

  Future<dynamic> showDeleteReviewDialog(
      BuildContext context, ReviewsCubit cubit) {
    return showDialog(
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

  Future<dynamic> showEditReviewBottomSheet(
      BuildContext context, ReviewsCubit cubit) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      )),
      builder: (context) => BlocProvider.value(
        value: cubit,
        child: EditReviewBottomSheet(review: review),
      ),
    );
  }
}
