import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/features/orders/presentation/views/widgets/order_status_filters.dart';
import 'package:looqma/features/orders/presentation/views/widgets/orders_list_view.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Orders'),
        body: Padding(
          padding: EdgeInsets.all(10.r),
          child: Column(
            children: [
              const OrderStatusFilters(),
              SizedBox(height: 10.h),
              const OrdersListView(),
            ],
          ),
        ));
  }
}
