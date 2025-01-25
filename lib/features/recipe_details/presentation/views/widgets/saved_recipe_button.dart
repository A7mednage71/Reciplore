import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:looqma/core/utils/app_colors.dart';

class SavedRecipeButton extends StatelessWidget {
  const SavedRecipeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 14.r,
      backgroundColor: AppColors.white,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: const Icon(IconlyLight.bookmark),
        color: AppColors.primaryDarker,
        iconSize: 18.sp,
      ),
    );
  }
}
