import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/best_seller_ingredient_section.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/home_market_ingredients_section.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_banners.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_home_info_data.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_search_text_field.dart';

class HomeMarketScreen extends StatelessWidget {
  const HomeMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          const MarketHomeInfoData(),
          SizedBox(height: 20.h),
          const MarketSearchTextField(),
          SizedBox(height: 20.h),
          const MarketBanners(),
          SizedBox(height: 10.h),
          const HomeMarketIngredientsSection(),
          SizedBox(height: 20.h),
          const BestSellerIngredientsSection(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
