import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:lottie/lottie.dart';

class FailureState extends StatelessWidget {
  const FailureState({super.key, required this.hight, this.width});

  final double hight;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight + 40.h,
      width: width ?? double.infinity,
      child: Column(
        children: [
          Lottie.asset(
            AppAssets.imagesFailureState,
            height: hight,
            width: hight,
          ),
          SizedBox(height: 10.h),
          Text('Failure Fetch Data', style: AppStyles.smallBoldText)
        ],
      ),
    );
  }
}
