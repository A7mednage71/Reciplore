import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/features/home_market/presentation/cubit/cubit/home_market_cubit.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/loading_ingredients_listview.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_ingredient_item.dart';

class HomeMarketIngredientsListView extends StatelessWidget {
  const HomeMarketIngredientsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: BlocBuilder<HomeMarketCubit, HomeMarketState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            failure: (failure) => FailureState(hight: 50.h, message: failure),
            loading: () => const LoadingIngredientsListView(),
            fetchIngredientsSuccess: (ingredients) {
              return ListView.builder(
                itemCount: ingredients.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 0 : 15.w),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).pushNamed(
                          Routes.marketIngredientsDetails,
                          arguments: ingredients[index]);
                    },
                    child: MarketIngredientItem(
                      ingredient: ingredients[index],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
