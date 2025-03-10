import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/ingredient_grid_view.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/search_and_cart.dart';

class HomeMarketScreen extends StatelessWidget {
  const HomeMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.all(30.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Reciplore", style: AppStyles.largeBoldText),
                    SizedBox(height: 5.h),
                    Text("What are you want to buy today?",
                        style: AppStyles.smallRegularText
                            .copyWith(color: AppColors.grayLight)),
                  ],
                ),
              ],
            ),
          ),
          const SearchAndCart(),
          SizedBox(height: 20.h),
          const IngredientGridView()
        ],
      ),
    );
  }
}
