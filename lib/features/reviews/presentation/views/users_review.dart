import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/reviews/presentation/views/widgets/comments_list_view.dart';
import 'package:looqma/features/reviews/presentation/views/widgets/leave_comment.dart';

class UsersReview extends StatelessWidget {
  const UsersReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Reviews'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.topRight,
                child: Text('200 Comment',
                    style: AppStyles.smallRegularText.copyWith(
                      color: AppColors.grayLight,
                    )),
              ),
              SizedBox(height: 7.h),
              const LeaveComment(),
              SizedBox(height: 30.h),
              const CommentsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
