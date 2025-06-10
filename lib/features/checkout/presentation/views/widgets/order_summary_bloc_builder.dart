import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/features/checkout/presentation/cubit/checkout/checkout_cubit.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/order_summary.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/order_summary_loading_skeleton.dart';

class OrderSummaryBlocBuilder extends StatelessWidget {
  const OrderSummaryBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      buildWhen: (previous, current) =>
          previous.cartOverview != current.cartOverview,
      builder: (context, state) {
        if (state.status == CheckoutStatus.failure) {
          return FailureState(hight: 40.h, message: state.message);
        } else if (state.status == CheckoutStatus.success) {
          return OrderSummary(cartOverview: state.cartOverview!);
        } else {
          return const OrderSummaryLoadingSkeleton();
        }
      },
    );
  }
}
