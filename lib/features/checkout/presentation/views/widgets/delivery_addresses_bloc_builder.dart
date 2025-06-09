import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/features/checkout/presentation/cubit/checkout/checkout_cubit.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/delivery_address_listview.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/delivery_address_listview_loading_skeleton.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/empty_address_list_view.dart';

class DeliveryAddressesBlocBuilder extends StatelessWidget {
  const DeliveryAddressesBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      buildWhen: (previous, current) =>
          previous.cartOverview?.addresses != current.cartOverview?.addresses,
      builder: (context, state) {
        if (state.status == CheckoutStatus.failure) {
          return FailureState(hight: 40.h, message: state.message);
        } else if (state.status == CheckoutStatus.success &&
            state.cartOverview!.addresses.isNotEmpty) {
          return DeliveryAddressListView(
              addresses: state.cartOverview!.addresses);
        } else if (state.status == CheckoutStatus.success &&
            state.cartOverview!.addresses.isEmpty) {
          return const EmptyAddressListWidget();
        } else {
          return const DeliveryAddressListViewLoadingSkeleton();
        }
      },
    );
  }
}
