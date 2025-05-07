import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_styles.dart';

class ServeNumbers extends StatelessWidget {
  const ServeNumbers({
    super.key,
    required this.stepsIsCounted,
    required this.length,
  });
  final bool stepsIsCounted;
  final int length;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppAssets.imagesServeIcon,
          width: 20,
        ),
        SizedBox(width: 10.w),
        Text(
          "1 Serve",
          style: AppStyles.extraSmallRegularGrayLightText,
        ),
        const Spacer(),
        if (stepsIsCounted)
          Text(
            "$length Steps",
            style: AppStyles.extraSmallRegularGrayLightText,
          ),
        if (!stepsIsCounted)
          Text(
            "$length Items",
            style: AppStyles.extraSmallRegularGrayLightText,
          ),
      ],
    );
  }
}
