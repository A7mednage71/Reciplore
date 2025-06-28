import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/common/widgets/warning_alert_dailog.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/orders/data/models/get_orders_response_model.dart';
import 'package:looqma/features/orders/presentation/cubit/orders_cubit/orders_cubit.dart';

class CancelOrderButton extends StatelessWidget {
  const CancelOrderButton({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listenWhen: (previous, current) =>
          previous.orderActionStatus != current.orderActionStatus,
      listener: (context, state) {
        if (state.orderActionStatus == OrderActionStatus.failure) {
          ShowToast.showSuccessToast(state.errorMessage ?? '');
        }
      },
      builder: (context, state) {
        return Container(
          width: 140.w,
          height: 30.h,
          padding: EdgeInsets.all(5.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            shape: BoxShape.rectangle,
            border: Border.all(color: AppColors.warningColor, width: 1.5),
          ),
          child: InkWell(
            onTap: () async {
              final ordersCubit = context.read<OrdersCubit>();
              showDialog(
                context: context,
                builder: (context) {
                  return WarningAlertDailog(
                    title: 'Cancel Order',
                    subtitle: 'Are you sure you want to cancel this order?',
                    onConfirmTitle: 'Yes',
                    onConfirm: () async {
                      await ordersCubit.cancelOrder(orderModel.id);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                  );
                },
              );
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cancel,
                  size: 15.r,
                  color: AppColors.warningColor,
                ),
                SizedBox(width: 10.w),
                Text(
                  'Cancel Order',
                  style: AppStyles.extraSmallBoldWarningText,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
