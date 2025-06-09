import 'package:flutter/material.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/checkout/data/models/cart_overview_response_model.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/order_summary.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrderSummaryLoadingSkeleton extends StatelessWidget {
  const OrderSummaryLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    CartOverviewResponseModel cartOverview = CartOverviewResponseModel(
      couponId: '',
      shippingFee: 11111,
      vatAmount: 111,
      coupondiscount: 1111,
      subTotal: 1111,
      total: 1111,
      addresses: [],
    );
    return Skeletonizer(
      enabled: true,
      containersColor: AppColors.white,
      child: OrderSummary(cartOverview: cartOverview),
    );
  }
}
