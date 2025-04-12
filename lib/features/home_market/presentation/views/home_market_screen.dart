import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:looqma/features/home_market/presentation/cubit/cubit/home_market_cubit.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/best_seller_ingredient_section.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/home_market_ingredients_section.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_banners_bloc_builder.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_home_info_data.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_search_text_field.dart';

class HomeMarketScreen extends StatelessWidget {
  const HomeMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeMarketCubit = context.read<HomeMarketCubit>();
    return RefreshIndicator(
      color: AppColors.primaryDarker,
      onRefresh: () async {
        homeMarketCubit.getIngredients(isRefresh: true);
        homeMarketCubit.getBestSellingIngredients();
        homeMarketCubit.getMarketBanners();
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            const MarketHomeInfoData(),
            SizedBox(height: 20.h),
            const MarketSearchTextField(),
            SizedBox(height: 20.h),
            const MarketBannersBlocBuilder(),
            SizedBox(height: 10.h),
            BlocListener<CartCubit, CartState>(
              listenWhen: (previous, current) =>
                  previous.status != CartStatus.cartActionSuccess &&
                  current.status == CartStatus.cartActionSuccess,
              listener: (context, state) {
                if (state.actionType == CartActionType.clearCart) {
                  homeMarketCubit.removeAllfromCart();
                } else if (state.actionType == CartActionType.toggleItem) {
                  homeMarketCubit
                      .toggleInCartStatus(state.lastAffectedIngredientId!);
                }
              },
              child: Column(
                children: [
                  const HomeMarketIngredientsSection(),
                  SizedBox(height: 20.h),
                  const BestSellerIngredientsSection(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
