import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:looqma/core/common/widgets/empty_state.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/common/widgets/ingredients_grid_view_skeleton.dart';
import 'package:looqma/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:looqma/features/home_market/presentation/cubit/cubit/home_market_cubit.dart';
import 'package:looqma/features/home_market/presentation/cubit/cubit/home_market_state.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_ingredient_item.dart';

class AllIngredientsGridView extends StatelessWidget {
  const AllIngredientsGridView({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    return Expanded(
      child: BlocBuilder<HomeMarketCubit, HomeMarketState>(
        buildWhen: (previous, current) =>
            previous.ingredients != current.ingredients,
        builder: (context, state) {
          if (state.status == HomeMarketStatus.initial) {
            return const SizedBox.shrink();
          } else if (state.status == HomeMarketStatus.loading) {
            return const IngredientsGridViewSkeleton();
          } else if (state.status == HomeMarketStatus.failure) {
            return FailureState(hight: 50.h, message: state.message);
          } else if (state.ingredients.isEmpty) {
            return const EmptyState(message: 'No ingredients found');
          } else {
            final ingredients = state.ingredients;
            return RefreshIndicator(
              color: AppColors.primaryDarker,
              onRefresh: () async {
                context.read<HomeMarketCubit>().getIngredients(isRefresh: true);
              },
              child: AnimationLimiter(
                child: GridView.builder(
                  itemCount: ingredients.length,
                  controller: scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 15.w,
                    childAspectRatio: 0.69,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pushNamed(
                            Routes.marketIngredientsDetails,
                            arguments: {
                              'ingredient': state.ingredients[index],
                              'cartCubit': cartCubit,
                            });
                      },
                      child: AnimationConfiguration.staggeredGrid(
                        position: index,
                        columnCount: 2,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          verticalOffset: 100.0,
                          child: FadeInAnimation(
                            child: MarketIngredientItem(
                              ingredient: ingredients[index],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
