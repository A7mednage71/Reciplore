import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/orders/data/models/get_orders_response_model.dart';
import 'package:looqma/features/orders/presentation/cubit/orders_cubit/orders_cubit.dart';
import 'package:looqma/features/orders/presentation/views/widgets/cancel_order_button.dart';
import 'package:looqma/features/orders/presentation/views/widgets/order_details_delivery_address_card.dart';
import 'package:looqma/features/orders/presentation/views/widgets/order_details_ingredients_listview.dart';
import 'package:looqma/features/orders/presentation/views/widgets/order_details_summary.dart';
import 'package:looqma/features/orders/presentation/views/widgets/order_status_filters.dart';
import 'package:looqma/features/orders/presentation/views/widgets/pay_now_button.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key, required this.order});
  final OrderModel order;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  void initState() {
    context
        .read<OrdersCubit>()
        .setCurrentOrderShownInOrderDetails(widget.order);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Order Details'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Delivery Address', style: AppStyles.mediumRegularText),
              SizedBox(height: 10.h),
              OrderDetailsDeliveryAddressCard(order: widget.order),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text('Order Summary', style: AppStyles.mediumRegularText),
                  const Spacer(),
                  BlocSelector<OrdersCubit, OrdersState, bool>(
                    selector: (state) =>
                        state.currentOrderDetails?.orderStatus ==
                        OrdersStatusFiltersEnum.pending.name,
                    builder: (context, isVisible) {
                      return Visibility(
                        visible: isVisible,
                        child: CancelOrderButton(orderModel: widget.order),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              OrderDetailsSummary(orderModel: widget.order),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Order Items', style: AppStyles.mediumRegularText),
                  BlocSelector<OrdersCubit, OrdersState, bool>(
                    selector: (state) =>
                        state.currentOrderDetails?.orderStatus ==
                            OrdersStatusFiltersEnum.pending.name &&
                        widget.order.paymentMethod != 'cash',
                    builder: (context, isVisible) {
                      return Visibility(
                        visible: isVisible,
                        child: PayNowButton(orderModel: widget.order),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              OrderDetailsIngredientsListView(order: widget.order),
            ],
          ),
        ),
      ),
    );
  }
}
