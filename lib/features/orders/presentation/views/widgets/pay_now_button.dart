import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/orders/data/models/get_orders_response_model.dart';
import 'package:looqma/features/orders/presentation/cubit/orders_cubit/orders_cubit.dart';
import 'package:looqma/features/orders/presentation/views/widgets/existing_order_payment_dialog.dart';

class PayNowButton extends StatelessWidget {
  const PayNowButton({
    super.key,
    required this.orderModel,
  });
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    final ordersCubit = context.read<OrdersCubit>();
    return Container(
      width: 140.w,
      height: 30.h,
      padding: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        shape: BoxShape.rectangle,
        border: Border.all(color: AppColors.secondaryDark, width: 1.5),
      ),
      child: InkWell(
        onTap: () async {
          showDialog(
            context: context,
            builder: (context) => BlocProvider.value(
              value: ordersCubit,
              child: ExistingOrderPaymentDialog(orderId: orderModel.id),
            ),
          );
        },
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_balance_wallet,
              size: 15.r,
              color: AppColors.secondaryDark,
            ),
            SizedBox(width: 10.w),
            Text(
              'Pay Now',
              style: AppStyles.extraSmallBoldText.copyWith(
                color: AppColors.secondaryDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
