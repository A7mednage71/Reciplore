import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class SendReviewButton extends StatelessWidget {
  const SendReviewButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
            style: AppStyles.smallRegularText.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
