import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/extensions/string_ex.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/orders/data/models/get_orders_response_model.dart';
import 'package:looqma/features/orders/presentation/cubit/orders_cubit/orders_cubit.dart';
import 'package:looqma/features/orders/presentation/views/widgets/order_details_summary_row.dart';

class OrderDetailsSummary extends StatelessWidget {
  const OrderDetailsSummary({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.all(15.r),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderDetailsSummaryRow(label: 'Order Id', value: orderModel.id),
              OrderDetailsSummaryRow(
                  label: 'Subtotal', value: '\$${orderModel.subTotal}'),
              OrderDetailsSummaryRow(
                  label: 'Coupon', value: orderModel.couponId ?? "N/A"),
              OrderDetailsSummaryRow(
                label: 'Discount',
                value:
                    '\$${orderModel.subTotal + orderModel.vat + orderModel.shippingFee - orderModel.total}',
              ),
              OrderDetailsSummaryRow(
                  label: 'Shipping Fee', value: '\$${orderModel.shippingFee}'),
              OrderDetailsSummaryRow(
                  label: 'VAT', value: '\$${orderModel.vat}'),
              OrderDetailsSummaryRow(
                  label: 'Total', value: '\$${orderModel.total}'),
              BlocSelector<OrdersCubit, OrdersState, String?>(
                selector: (state) => state.currentOrderDetails?.orderStatus,
                builder: (context, status) {
                  return OrderDetailsSummaryRow(
                    label: 'Order Status',
                    value: status ?? orderModel.orderStatus,
                  );
                },
              ),
              OrderDetailsSummaryRow(
                label: 'Payment Method',
                value: orderModel.paymentMethod,
              ),
              OrderDetailsSummaryRow(
                  label: 'Ordered At', value: orderModel.orderedAt.formatDate),
              OrderDetailsSummaryRow(
                  label: 'Delivery Time',
                  value: orderModel.estimatedDeliveryDate.formatDate),
            ],
          ),
        ),
      ),
    );
  }
}
