import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/extensions/string_ex.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/orders/data/models/get_orders_response_model.dart';
import 'package:looqma/features/orders/presentation/views/widgets/order_status_filters.dart';

class OrderListItemStatus extends StatelessWidget {
  const OrderListItemStatus({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 30.h,
      padding: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        shape: BoxShape.rectangle,
        border: Border.all(
            color:
                orderModel.orderStatus == OrdersStatusFiltersEnum.cancelled.name
                    ? AppColors.warningColor
                    : AppColors.primaryDarker,
            width: 1.5),
      ),
      child: Center(
        child: Text(
          orderModel.orderStatus.capitalizeEachWord,
          style:
              orderModel.orderStatus == OrdersStatusFiltersEnum.cancelled.name
                  ? AppStyles.extraSmallBoldWarningText
                  : AppStyles.extraSmallBoldprimaryDarkerText,
        ),
      ),
    );
  }
}
