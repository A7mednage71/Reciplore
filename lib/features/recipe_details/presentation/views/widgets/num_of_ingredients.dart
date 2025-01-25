import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class NumOfIngredients extends StatelessWidget {
  const NumOfIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppAssets.bellIcon,
          width: 20,
        ),
        Text(
          "1 Serve",
          style: AppStyles.extraSmallRegularText
              .copyWith(color: AppColors.grayLight),
        ),
        const Spacer(),
        Text(
          "10 Items",
          style: AppStyles.extraSmallRegularText
              .copyWith(color: AppColors.grayLight),
        ),
      ],
    );
  }
}
