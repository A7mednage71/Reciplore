import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class CustomPopUpMenueButton extends StatefulWidget {
  const CustomPopUpMenueButton({super.key});

  @override
  State<CustomPopUpMenueButton> createState() => _CustomPopUpMenueButtonState();
}

class _CustomPopUpMenueButtonState extends State<CustomPopUpMenueButton> {
  List<PopupMenuItem<String>> dropdownItems = [
    PopupMenuItem(
      value: "share",
      child: Row(
        children: [
          const Icon(Icons.share, color: AppColors.black),
          SizedBox(width: 16.w),
          Text(
            'Share',
            style: AppStyles.smallRegularText,
          ),
        ],
      ),
    ),
    PopupMenuItem(
      value: "rate",
      child: Row(
        children: [
          const Icon(Icons.star, color: AppColors.black),
          SizedBox(width: 16.w),
          Text('Rate Recipe', style: AppStyles.smallRegularText),
        ],
      ),
    ),
    PopupMenuItem(
      value: "review",
      child: Row(
        children: [
          const Icon(Icons.reviews, color: AppColors.black),
          SizedBox(width: 16.w),
          Text('Review', style: AppStyles.smallRegularText),
        ],
      ),
    ),
    PopupMenuItem(
      value: "unsave",
      child: Row(
        children: [
          const Icon(Icons.cancel_presentation_sharp, color: AppColors.black),
          SizedBox(width: 16.w),
          Text('Unsave', style: AppStyles.smallRegularText),
        ],
      ),
    ),
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      icon: const Icon(
        Icons.more_horiz,
        color: AppColors.black,
        size: 24,
      ),
      color: AppColors.white,
      onSelected: (String value) {
        switch (value) {
          case "share":
            // Implement share functionality
            break;
          case "rate":
            // Navigate to Rate Screen
            break;
          case "review":
            // Navigate to Review Screen
            Navigator.pushNamed(context, Routes.reviewScreen);
            break;
          case "unsave":
            // Implement unsave logic
            break;
        }
      },
      itemBuilder: (BuildContext context) {
        return dropdownItems;
      },
    );
  }
}
