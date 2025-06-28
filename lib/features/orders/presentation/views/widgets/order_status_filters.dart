import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/orders/presentation/cubit/orders_cubit/orders_cubit.dart';

enum OrdersStatusFiltersEnum {
  all,
  pending,
  placed,
  confirmed,
  delivered,
  returned,
  dropped,
  refunded,
  onway,
  cancelled
}

class OrderStatusFilters extends StatefulWidget {
  const OrderStatusFilters({super.key});

  @override
  State<OrderStatusFilters> createState() => _OrderStatusFiltersState();
}

class _OrderStatusFiltersState extends State<OrderStatusFilters> {
  String selectedStatus = 'all';
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: [
        ChoiceChip(
          label: const Text('All'),
          labelStyle: AppStyles.extraSmallBoldText,
          selectedColor: AppColors.secondaryLight,
          selected: selectedStatus == OrdersStatusFiltersEnum.all.name,
          onSelected: (bool selected) {
            setState(() {
              selectedStatus = OrdersStatusFiltersEnum.all.name;
            });
            context.read<OrdersCubit>().filterOrders(status: selectedStatus);
          },
        ),
        ChoiceChip(
          label: const Text('Pending'),
          labelStyle: AppStyles.extraSmallBoldText,
          selectedColor: AppColors.secondaryLight,
          selected: selectedStatus == OrdersStatusFiltersEnum.pending.name,
          onSelected: (bool selected) {
            setState(() {
              selectedStatus = OrdersStatusFiltersEnum.pending.name;
            });
            context.read<OrdersCubit>().filterOrders(status: selectedStatus);
          },
        ),
        ChoiceChip(
          label: const Text('Delivered'),
          labelStyle: AppStyles.extraSmallBoldText,
          selectedColor: AppColors.secondaryLight,
          selected: selectedStatus == OrdersStatusFiltersEnum.delivered.name,
          onSelected: (bool selected) {
            setState(() {
              selectedStatus = OrdersStatusFiltersEnum.delivered.name;
            });
            context.read<OrdersCubit>().filterOrders(status: selectedStatus);
          },
        ),
        ChoiceChip(
          label: const Text('Cancelled'),
          labelStyle: AppStyles.extraSmallBoldText,
          selectedColor: AppColors.secondaryLight,
          selected: selectedStatus == OrdersStatusFiltersEnum.cancelled.name,
          onSelected: (bool selected) {
            setState(() {
              selectedStatus = OrdersStatusFiltersEnum.cancelled.name;
            });
            context.read<OrdersCubit>().filterOrders(status: selectedStatus);
          },
        ),
      ],
    );
  }
}
