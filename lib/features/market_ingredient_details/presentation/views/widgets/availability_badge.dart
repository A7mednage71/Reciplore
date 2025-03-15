import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class AvailabilityBadge extends StatelessWidget {
  final bool isAvailable;

  const AvailabilityBadge({super.key, required this.isAvailable});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Chip(
        label: Text(
          isAvailable ? 'In Stock' : 'Unavailable',
          style: AppStyles.smallBoldText.copyWith(color: AppColors.white),
        ),
        backgroundColor: isAvailable ? AppColors.primarybright : AppColors.red,
        avatar: Icon(
          isAvailable ? Icons.check_circle : Icons.cancel,
          color: AppColors.white,
          size: 18.r,
        ),
      ),
    );
  }
}
