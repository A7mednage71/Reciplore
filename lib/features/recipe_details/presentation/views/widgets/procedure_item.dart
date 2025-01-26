import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class ProcedureItem extends StatelessWidget {
  const ProcedureItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.grayLighter,
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text("Step 1", style: AppStyles.smallBoldText),
                  SizedBox(height: 5.h),
                  Text(
                    "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?",
                    style: AppStyles.smallRegularText
                        .copyWith(color: AppColors.grayLight),
                  ),
                  SizedBox(height: 10.h)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
