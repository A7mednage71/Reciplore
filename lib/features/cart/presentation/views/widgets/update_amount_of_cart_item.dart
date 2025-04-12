import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/cart/data/models/get_cart_reponse_model.dart';
import 'package:looqma/features/cart/data/models/update_cart_request_model.dart';
import 'package:looqma/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';

class UpdateAmountOfCartItem extends StatelessWidget {
  const UpdateAmountOfCartItem({
    super.key,
    required this.cartIngredientModel,
  });

  final CartIngredientModel cartIngredientModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () async {
            await context.read<CartCubit>().updateCart(
                cartIngredientModel.ingredient.id,
                UpdateCartRequestModel(
                    quantity: cartIngredientModel.quantity + 1));
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              border: Border.all(color: AppColors.primaryDarker, width: 1.5.w),
            ),
            child: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
        ),
        5.h.verticalSpace,
        Text(
          '${cartIngredientModel.quantity}',
          style: AppStyles.smallBoldText,
        ),
        5.h.verticalSpace,
        InkWell(
          onTap: () async {
            if (cartIngredientModel.quantity == 1) return;
            await context.read<CartCubit>().updateCart(
                cartIngredientModel.ingredient.id,
                UpdateCartRequestModel(
                    quantity: cartIngredientModel.quantity - 1));
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              border: Border.all(color: AppColors.primaryDarker, width: 1.5.w),
            ),
            child: const Icon(
              Icons.remove,
              color: AppColors.primaryDark,
            ),
          ),
        ),
      ],
    );
  }
}
