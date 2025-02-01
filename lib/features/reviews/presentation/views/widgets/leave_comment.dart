import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class LeaveComment extends StatelessWidget {
  const LeaveComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Leave a comment',
          style: AppStyles.mediumRegularText,
        ),
        SizedBox(height: 7.h),
        Form(
          key: GlobalKey<FormState>(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: CustomTextField(
            controller: TextEditingController(),
            hintText: 'Say something...',
            maxLines: 2,
            keyboardType: TextInputType.text,
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'Please enter some Words...';
              }
              return null;
            },
            suffixIcon: Padding(
              padding: EdgeInsets.all(8.r),
              child: InkWell(
                onTap: () {},
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
              ),
            ),
          ),
        ),
      ],
    );
  }
}
