import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looqma/core/common/widgets/failure_alert_dialog.dart';
import 'package:looqma/core/common/widgets/loading_alert_dialog.dart';
import 'package:looqma/core/common/widgets/warning_alert_dailog.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/features/checkout/data/models/payment_web_view_argument.dart';
import 'package:looqma/features/orders/presentation/cubit/orders_cubit/orders_cubit.dart';

class ExistingOrderPaymentDialog extends StatelessWidget {
  const ExistingOrderPaymentDialog({super.key, required this.orderId});

  final String orderId;

  @override
  Widget build(BuildContext context) {
    final ordersCubit = context.read<OrdersCubit>();
    return BlocConsumer<OrdersCubit, OrdersState>(
      listenWhen: (previous, current) =>
          previous.orderActionStatus != current.orderActionStatus &&
          previous.orderActionType == OrderActionType.preparePaymentSession,
      listener: (context, state) async {
        if (state.orderActionStatus == OrderActionStatus.success) {
          await Navigator.of(context).pushNamed(Routes.paymentWebView,
              arguments: PaymentWebViewArgument(
                paymentUrl: state.paymentSession!.checkOutSession.url,
                onSuccess: () {
                  ordersCubit.updateOrderAspaidOrder(id: orderId);
                  context.doublePop();
                },
                onFailure: () {
                  context.doublePop();
                },
              ));
        }
      },
      buildWhen: (previous, current) =>
          previous.orderActionStatus != current.orderActionStatus &&
          previous.orderActionType == OrderActionType.preparePaymentSession,
      builder: (context, state) {
        if (state.orderActionStatus == OrderActionStatus.failure) {
          return FailureAlertDialog(
            title: "Error in Loading Payment Session ..!!",
            subtitle: state.errorMessage ?? "",
            onConfirmTitle: "Retry",
            onConfirm: () {
              context.doublePop();
            },
          );
        } else if (state.orderActionStatus == OrderActionStatus.loading) {
          return const LoadingAlertDialog(
            title: 'Loading Session',
            subtitle: 'Please Wait for Loading Payment Session ...!!',
          );
        } else {
          return WarningAlertDailog(
            title: "Pay Now",
            subtitle: "Are you sure you want to make a payment now?",
            onConfirmTitle: "Pay Now",
            onConfirm: () async {
              await ordersCubit.prepareStripeSession(orderId: orderId);
            },
          );
        }
      },
    );
  }
}
