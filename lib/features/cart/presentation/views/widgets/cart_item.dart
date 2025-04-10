import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/cart/data/models/get_cart_reponse_model.dart';
import 'package:looqma/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:looqma/features/cart/presentation/views/widgets/update_amount_of_cart_item.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/ingredient_cached_image.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartIngredientModel});
  final CartIngredientModel cartIngredientModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.2,
          children: [
            SlidableAction(
              onPressed: (context) async {
                await context
                    .read<CartCubit>()
                    .removeFromCart(cartIngredientModel.ingredient.id);
              },
              backgroundColor: AppColors.red,
              foregroundColor: AppColors.white,
              icon: Icons.clear,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            border: Border.all(color: AppColors.grayLighter, width: 1.5.w),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100.w,
                  child: IngredientCachedImage(
                      image: cartIngredientModel.ingredient.image.secureUrl),
                ),
                10.w.horizontalSpace,
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartIngredientModel.ingredient.name,
                        style: AppStyles.smallBoldText,
                      ),
                      5.h.verticalSpace,
                      Text(
                        '\$${cartIngredientModel.price} / 1 kg, Price',
                        style: AppStyles.smallRegularText
                            .copyWith(color: AppColors.grayLight),
                      ),
                      10.h.verticalSpace,
                      Text(
                        '\$${(cartIngredientModel.price * cartIngredientModel.quantity).toStringAsFixed(2)}',
                        style: AppStyles.smallBoldText
                            .copyWith(color: AppColors.primaryDark),
                      ),
                    ],
                  ),
                ),
                5.w.horizontalSpace,
                UpdateAmountOfCartItem(
                    cartIngredientModel: cartIngredientModel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
