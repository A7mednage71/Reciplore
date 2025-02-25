import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:lottie/lottie.dart';

class SearchLottie extends StatelessWidget {
  const SearchLottie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Lottie.asset(
        AppAssets.imagesSearchLottie,
        height: 250.h,
        width: 200.w,
      ),
    );
  }
}
