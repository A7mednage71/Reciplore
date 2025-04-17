import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/cart/data/models/add_to_cart_request_model.dart';
import 'package:looqma/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';

class IngredientQuantityAndCartButton extends StatefulWidget {
  const IngredientQuantityAndCartButton(
      {super.key, required this.ingredientDataModel});
  final IngredientDataModel ingredientDataModel;

  @override
  State<IngredientQuantityAndCartButton> createState() =>
      _IngredientQuantityAndCartButtonState();
}

class _IngredientQuantityAndCartButtonState
    extends State<IngredientQuantityAndCartButton> {
  int quantity = 1;
  late bool isInCart;

  @override
  void initState() {
    isInCart = widget.ingredientDataModel.inCart ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 25.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black26,
            blurRadius: 10.r,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primaryDarker,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: InkWell(
                    onTap: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    child: Icon(
                      Icons.remove,
                      size: 20.r,
                      color: AppColors.primaryDarker,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Text('$quantity',
                        style: AppStyles.mediumBoldprimaryDarkerText),
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primaryDarker,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (quantity > widget.ingredientDataModel.stock) {
                          return ShowToast.showFailureToast(
                              'Quantity exceeds stock');
                        }
                        quantity++;
                      });
                    },
                    child: Icon(
                      Icons.add,
                      size: 20.r,
                      color: AppColors.primaryDarker,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: BlocConsumer<CartCubit, CartState>(
              listenWhen: (previous, current) =>
                  previous.status != CartStatus.cartActionSuccess ||
                  previous.status != CartStatus.cartActionFailure &&
                      current.status == CartStatus.cartActionSuccess ||
                  current.status == CartStatus.cartActionFailure,
              listener: (context, state) {
                if (state.status == CartStatus.cartActionSuccess &&
                    state.actionType == CartActionType.toggleItem) {
                  isInCart = !isInCart;
                  ShowToast.showSuccessToast(state.responseMessage ?? '');
                } else if (state.status == CartStatus.cartActionFailure) {
                  return ShowToast.showFailureToast('Something went wrong');
                }
              },
              buildWhen: (previous, current) =>
                  previous.status != CartStatus.cartActionSuccess &&
                  current.status == CartStatus.cartActionSuccess,
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: isInCart
                      ? () async {
                          context
                              .read<CartCubit>()
                              .removeFromCart(widget.ingredientDataModel.id);
                        }
                      : () async {
                          context.read<CartCubit>().addToCart(
                              addToCartRequestModel: AddToCartRequestModel(
                                  ingredientId: widget.ingredientDataModel.id,
                                  quantity: quantity));
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isInCart ? AppColors.red : AppColors.primarybright,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    fixedSize: Size(double.maxFinite, 50.h),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isInCart ? 'Remove' : 'Add',
                        style: AppStyles.smallBoldWhiteText,
                      ),
                      SizedBox(width: 10.w),
                      Icon(
                        isInCart
                            ? Icons.remove_shopping_cart_outlined
                            : Icons.add_shopping_cart_outlined,
                        color: AppColors.white,
                        size: 20.r,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
