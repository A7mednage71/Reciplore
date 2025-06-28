import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:looqma/features/checkout/presentation/cubit/checkout/checkout_cubit.dart';

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listenWhen: (previous, current) =>
          previous.placeOrderStatus != current.placeOrderStatus &&
          (current.placeOrderStatus == PlaceOrderStatus.failure ||
              current.placeOrderStatus == PlaceOrderStatus.success),
      listener: (context, state) async {
        if (state.placeOrderStatus == PlaceOrderStatus.failure) {
          ShowToast.showFailureToast(state.placeOrderMessage ?? '');
        }
        if (state.placeOrderStatus == PlaceOrderStatus.success) {
          ShowToast.showSuccessToast(state.placeOrderMessage ?? '');
          await cartCubit.clearCart();
          if (context.mounted) {
            context.pushNamed(Routes.ordersScreen);
          }
        }
      },
      buildWhen: (previous, current) =>
          previous.placeOrderStatus != current.placeOrderStatus,
      builder: (context, state) {
        if (state.placeOrderStatus == PlaceOrderStatus.loading) {
          return Container(
            width: double.infinity,
            height: 60.h,
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: SpinKitFadingCircle(color: AppColors.white, size: 40.r),
            ),
          );
        } else {
          return InkWell(
            onTap: () async {
              final checkout = context.read<CheckoutCubit>();
              if (!checkout.contactNumberFormKey.currentState!.validate()) {
                return;
              }
              if (checkout.state.paymentMethod == null) {
                ShowToast.showFailureToast('Please select payment method');
                return;
              }
              if (checkout.state.shippingAddressID == null) {
                ShowToast.showFailureToast('Please select shipping address');
                return;
              }
              await checkout.placeOrder();
            },
            child: Container(
              width: double.infinity,
              height: 60.h,
              decoration: BoxDecoration(
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Text(
                  "Place Order",
                  style: AppStyles.normalBoldWhiteText,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
