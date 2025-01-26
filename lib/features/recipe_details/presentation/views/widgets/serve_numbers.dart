import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class ServeNumbers extends StatelessWidget {
  const ServeNumbers({super.key, required this.stepsIsCounted});
  final bool stepsIsCounted;
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
          style: AppStyles.extraSmallRegularText
              .copyWith(color: AppColors.grayLight),
        ),
        const Spacer(),
        if (stepsIsCounted)
          Text(
            "10 Steps",
            style: AppStyles.extraSmallRegularText
                .copyWith(color: AppColors.grayLight),
          ),
        if (!stepsIsCounted)
          Text(
            "10 Items",
            style: AppStyles.extraSmallRegularText
                .copyWith(color: AppColors.grayLight),
          ),
      ],
    );
  }
}
