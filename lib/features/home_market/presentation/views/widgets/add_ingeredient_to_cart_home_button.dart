import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/cart/data/models/add_to_cart_request_model.dart';
import 'package:looqma/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:looqma/features/home_market/presentation/cubit/cubit/home_market_cubit.dart';

class AddIngredientToCartHomeButton extends StatelessWidget {
  const AddIngredientToCartHomeButton({
    super.key,
    required this.ingredient,
  });
  final IngredientDataModel ingredient;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listenWhen: (previous, current) =>
          previous.status != CartStatus.cartActionSuccess &&
          current.status == CartStatus.cartActionSuccess,
      listener: (context, state) {
        if (state.status == CartStatus.cartActionSuccess) {
          log("toggled ${ingredient.inCart}");
          log("333333333333333333");

          // context.read<HomeMarketCubit>().toggleInCartStatus(ingredient.id);
        }
      },
      child: InkWell(
        onTap: () async {
          if (ingredient.inCart!) {
            await context.read<CartCubit>().removeFromCart(ingredient.id);
          } else {
            await context.read<CartCubit>().addToCart(
                addToCartRequestModel: AddToCartRequestModel(
                    ingredientId: ingredient.id, quantity: 1));
          }
          if (context.mounted) {
            context.read<HomeMarketCubit>().toggleInCartStatus(ingredient.id);
          }
        },
        child: Container(
          width: 30.w,
          height: 30.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryDark,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Icon(
              ingredient.inCart!
                  ? Icons.remove_shopping_cart_outlined
                  : Icons.add_shopping_cart,
              size: 20.r,
              color: AppColors.primaryDark,
            ),
          ),
        ),
      ),
    );
  }
}
