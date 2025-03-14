import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_home_info_data.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_ingredients_grid_view.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_search_text_field.dart';

class HomeMarketScreen extends StatelessWidget {
  const HomeMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 40.h),
          const MarketHomeInfoData(),
          SizedBox(height: 20.h),
          const MarketSearchTextField(),
          SizedBox(height: 10.h),
          const MarketIngredientsGridView(),
        ],
      ),
    );
  }
}
