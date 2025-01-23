import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_styles.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Filter Search",
              style: AppStyles.smallBoldText,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            "Rate",
            style: AppStyles.smallBoldText,
          ),
          SizedBox(height: 20.h),
          Text(
            "Category",
            style: AppStyles.smallBoldText,
          ),
        ],
      ),
    );
  }
}
