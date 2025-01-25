import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class ApplyFilter extends StatelessWidget {
  const ApplyFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 40.h,
          width: 174.w,
          decoration: const BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Text(
              "Apply Filter",
              style: AppStyles.smallBoldText.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
