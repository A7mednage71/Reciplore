import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class ApplyFilter extends StatelessWidget {
  const ApplyFilter({super.key, requir, required this.onTap});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40.h,
          width: 150.w,
          decoration: const BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Text(
              "Apply",
              style: AppStyles.smallBoldWhiteText,
            ),
          ),
        ),
      ),
    );
  }
}
