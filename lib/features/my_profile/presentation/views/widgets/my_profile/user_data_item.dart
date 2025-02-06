import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class UserDataItem extends StatelessWidget {
  const UserDataItem({
    super.key,
    required this.icon,
    required this.content,
  });

  final IconData icon;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: AppColors.primaryMedium),
        SizedBox(width: 10.w),
        Text(content,
            style: AppStyles.smallRegularText
                .copyWith(color: AppColors.grayMedium)),
      ],
    );
  }
}
