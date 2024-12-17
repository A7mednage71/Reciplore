import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_styles.dart';

class SighnUpTopInfo extends StatelessWidget {
  const SighnUpTopInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Create an account",
          style: AppStyles.largeBoldText,
        ),
        SizedBox(height: 8.h),
        Text(
          "Let’s help you set up your account,\nit won’t take long.",
          style: AppStyles.smallRegularText,
        )
      ],
    );
  }
}
