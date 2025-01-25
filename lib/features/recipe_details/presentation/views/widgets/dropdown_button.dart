import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  final List<DropdownMenuItem<String>> dropdownItems = [
    DropdownMenuItem(
      value: "share",
      child: InkWell(
        onTap: () {
        },
        child: Row(
          children:  [
            Icon(Icons.share,color: AppColors.black),
            SizedBox(width: 16.w),
            Text('Share',style: AppStyles.smallRegularText,),
          ],
        ),
      ),
    ),
    DropdownMenuItem(
      value: "rate",
      child: InkWell(
        onTap: () {
        },
        child: Row(
          children:  [
            Icon(Icons.star,color: AppColors.black,),
            SizedBox(width: 16.w),
            Text('Rate Recipe',style: AppStyles.smallRegularText),
          ],
        ),
      ),
    ),
    DropdownMenuItem(
      value: "review",
      child: InkWell(
        onTap: () {
        },
        child: Row(
          children:  [
            Icon(Icons.reviews,color: AppColors.black,),
            SizedBox(width: 16.w),
            Text('Review',style: AppStyles.smallRegularText),
          ],
        ),
      ),
    ),
    DropdownMenuItem(
      value: "unsave",
      child: InkWell(
        onTap: () {
        },
        child: Row(
          children:  [
            Icon(Icons.cancel_presentation_sharp,color: AppColors.black,),
            SizedBox(width: 16.w),
            Text('Unsave',style: AppStyles.smallRegularText),
          ],
        ),
      ),
    ),
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      icon: Icon(
        Icons.more_horiz,
        color: AppColors.black,
        size: 24,
      ),
      elevation: 16,
      underline: Container(height: 2),
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
      },
      items: dropdownItems,
    );
  }
}
