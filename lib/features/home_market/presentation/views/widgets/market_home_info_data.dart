import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class MarketHomeInfoData extends StatelessWidget {
  const MarketHomeInfoData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reciplore Market", style: AppStyles.largeBoldText),
            SizedBox(height: 5.h),
            Text("Get the best ingredients and\nstart cooking today!",
                style: AppStyles.smallRegularText
                    .copyWith(color: AppColors.grayLight)),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: SvgPicture.asset(
            AppAssets.imagesCart,
            height: 30.h,
            width: 30.w,
            colorFilter: const ColorFilter.mode(
                AppColors.secondaryMedium, BlendMode.srcIn),
          ),
        )
      ],
    );
  }
}
