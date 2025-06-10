import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:looqma/features/home_market/presentation/cubit/cubit/home_market_cubit.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/home_market_ingredients_list_view.dart';

class HomeMarketIngredientsSection extends StatelessWidget {
  const HomeMarketIngredientsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final homemarketcubit = context.read<HomeMarketCubit>();
    final cartCubit = context.read<CartCubit>();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Row(
            children: [
              Text('Ingredients', style: AppStyles.mediumBoldText),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pushNamed(
                    Routes.allIngredients,
                    arguments: {
                      'homeMarketCubit': homemarketcubit,
                      'cartCubit': cartCubit,
                    },
                  );
                },
                child: Row(
                  children: [
                    Text('See All',
                        style: AppStyles.smallRegularsecondaryDarkText),
                    SizedBox(width: 5.w),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: AppColors.secondaryDark,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const HomeMarketIngredientsListView(),
      ],
    );
  }
}
