import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/ingredient_grid_view.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/search.dart';

class HomeMarketScreen extends StatelessWidget {
  const HomeMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          SizedBox(height: 40.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Reciplore Market", style: AppStyles.mediumBoldText),
                  SizedBox(height: 5.h),
                  Text("Let's buy ingredients for your recipe",
                      style: AppStyles.smallRegularText
                          .copyWith(color: AppColors.grayLight)),
                ],
              ),
              const Spacer(),
              InkWell(child: SvgPicture.asset(AppAssets.imagesCart,height: 35.h,))
            ],
          ),
           SizedBox(height: 20.h,),
          const Search(),
          SizedBox(height: 20.h),
          const IngredientGridView()
        ],
      ),
    );
  }
}
