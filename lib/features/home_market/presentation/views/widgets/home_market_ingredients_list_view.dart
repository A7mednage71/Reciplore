import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/empty_state.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:looqma/features/home_market/presentation/cubit/cubit/home_market_cubit.dart';
import 'package:looqma/features/home_market/presentation/cubit/cubit/home_market_state.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/loading_ingredients_listview.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_ingredient_item.dart';

class HomeMarketIngredientsListView extends StatelessWidget {
  const HomeMarketIngredientsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeMarketCubit = context.read<HomeMarketCubit>();
    final cartCubit = context.read<CartCubit>();
    return SizedBox(
      height: 250.h,
      child: BlocBuilder<HomeMarketCubit, HomeMarketState>(
        buildWhen: (previous, current) =>
            previous.ingredients != current.ingredients,
        builder: (context, state) {
          if (state.status == HomeMarketStatus.initial) {
            return const SizedBox.shrink();
          } else if (state.status == HomeMarketStatus.loading) {
            return const LoadingIngredientsListView();
          } else if (state.status == HomeMarketStatus.failure) {
            return FailureState(hight: 50.h, message: state.message);
          } else if (state.ingredients.isEmpty) {
            return const EmptyState(message: 'No ingredients found');
          } else {
            final ingredients = state.ingredients;
            return ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 0 : 15.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(Routes.marketIngredientsDetails, arguments: {
                      'ingredient': state.ingredients[index],
                      'cartCubit': cartCubit,
                      'homeMarketCubit': homeMarketCubit
                    });
                  },
                  child: MarketIngredientItem(
                    ingredient: ingredients[index],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
