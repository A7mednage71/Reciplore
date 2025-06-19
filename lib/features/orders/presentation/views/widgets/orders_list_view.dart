import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/empty_state.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/features/orders/presentation/cubit/orders_cubit/orders_cubit.dart';
import 'package:looqma/features/orders/presentation/views/widgets/order_list_item.dart';
import 'package:looqma/features/orders/presentation/views/widgets/orders_listview_loading_skeleton.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<OrdersCubit, OrdersState>(
        buildWhen: (previous, current) =>
            previous.filteredOrders != current.filteredOrders ||
            current.status == OrdersStatus.failure,
        builder: (context, state) {
          if (state.status == OrdersStatus.failure) {
            return FailureState(hight: 100.h, message: state.errorMessage);
          } else if (state.status == OrdersStatus.success &&
              state.filteredOrders!.isNotEmpty) {
            return ListView.builder(
              itemCount: state.filteredOrders!.length,
              itemBuilder: (context, index) {
                return OrderListItem(orderModel: state.filteredOrders![index]);
              },
            );
          } else if (state.status == OrdersStatus.success &&
              state.filteredOrders!.isEmpty) {
            return const EmptyState(message: 'No orders found');
          } else {
            return const OrdersListViewLoadingSkeleton();
          }
        },
      ),
    );
  }
}
