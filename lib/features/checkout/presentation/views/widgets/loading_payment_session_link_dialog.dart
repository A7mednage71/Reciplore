import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/checkout/presentation/cubit/checkout/checkout_cubit.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/cancel_button.dart';
import 'package:lottie/lottie.dart';

class LoadingPaymentSessionLinkDialog extends StatefulWidget {
  const LoadingPaymentSessionLinkDialog({super.key, required this.orderId});

  final String orderId;

  @override
  State<LoadingPaymentSessionLinkDialog> createState() =>
      _LoadingPaymentSessionLinkDialogState();
}

class _LoadingPaymentSessionLinkDialogState
    extends State<LoadingPaymentSessionLinkDialog> {
  @override
  void initState() {
    context.read<CheckoutCubit>().payWithStripe(orderId: widget.orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listenWhen: (previous, current) =>
          previous.paymentMethodStatus != current.paymentMethodStatus,
      listener: (context, state) {
        if (state.paymentMethodStatus == PaymentMethodStatus.success) {
          Navigator.of(context).pop();
          context.pushNamed(Routes.paymentWebView,
              arguments: state.checkoutSessionResponse!.checkOutSession.url);
        }
      },
      buildWhen: (previous, current) =>
          previous.paymentMethodStatus != current.paymentMethodStatus,
      builder: (context, state) {
        if (state.paymentMethodStatus == PaymentMethodStatus.failure) {
          return AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
              side: const BorderSide(color: AppColors.grayLight),
            ),
            title: Text(
              "Error in Loading Payment Session ..!!",
              style: AppStyles.smallBoldText,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  AppAssets.imagesFailureState,
                  height: 60.h,
                  width: 60.w,
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text('Retry',
                          style: AppStyles.extraSmallBoldprimaryDarkerText),
                      onPressed: () async {
                        await context
                            .read<CheckoutCubit>()
                            .payWithStripe(orderId: widget.orderId);
                      },
                    ),
                    const CancelButton()
                  ],
                ),
              ],
            ),
          );
        } else {
          return AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
              side: const BorderSide(color: AppColors.grayLight),
            ),
            title: Text(
              "Wait for Loading Payment Session ...!!",
              style: AppStyles.smallBoldText,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SpinKitPouringHourGlassRefined(
                    color: AppColors.secondaryDarker, size: 60.r),
                const CancelButton()
              ],
            ),
          );
        }
      },
    );
  }
}
