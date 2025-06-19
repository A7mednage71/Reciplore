import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/extensions/string_ex.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/orders/data/models/get_orders_response_model.dart';
import 'package:looqma/features/orders/data/models/order_details_argument.dart';
import 'package:looqma/features/orders/presentation/cubit/orders_cubit/orders_cubit.dart';
import 'package:looqma/features/orders/presentation/views/widgets/cancel_order_button.dart';
import 'package:looqma/features/orders/presentation/views/widgets/order_item_cached_image.dart';
import 'package:looqma/features/orders/presentation/views/widgets/order_status_filters.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(color: AppColors.grayLighter, width: 1.5.w),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 75.h,
                  width: 75.w,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      ...List.generate(
                        orderModel.orderIngredients.length > 3
                            ? 3
                            : orderModel.orderIngredients.length,
                        (index) => Positioned(
                          left: (index * 20).w,
                          child: OrderItemCachedImage(
                            image: orderModel.orderIngredients[index]
                                .ingredientData.image.secureUrl,
                          ),
                        ),
                      ),
                      if (orderModel.orderIngredients.length > 3)
                        Positioned(
                          left: 60.w,
                          child: Text(
                            '+${orderModel.orderIngredients.length - 3}',
                            style: AppStyles.mediumBoldWhiteText,
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(width: 50.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Order ID :  ',
                              style: AppStyles.smallRegularText,
                            ),
                            TextSpan(
                              text: orderModel.id,
                              style: AppStyles.verySmallBoldText,
                            ),
                          ],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        '\$ ${orderModel.total.toStringAsFixed(2)}',
                        style: AppStyles.smallBoldsecondaryDarkText,
                      ),
                      SizedBox(height: 5.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Payment : ',
                              style: AppStyles.smallRegularText,
                            ),
                            TextSpan(
                              text: orderModel.paymentMethod.capitalizeEachWord,
                              style: AppStyles.smallBoldText,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'status : ',
                          style: AppStyles.smallRegularText,
                        ),
                        SizedBox(width: 5.w),
                        Container(
                          width: 80.w,
                          height: 30.h,
                          padding: EdgeInsets.all(5.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                color: AppColors.grayLighter, width: 1.5),
                          ),
                          child: Center(
                            child: Text(
                              orderModel.orderStatus.capitalizeEachWord,
                              style: orderModel.orderStatus ==
                                      OrdersStatusFiltersEnum.cancelled.name
                                  ? AppStyles.extraSmallBoldWarningText
                                  : AppStyles.extraSmallBoldprimaryDarkerText,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    CancelOrderButton(orderModel: orderModel),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'details :',
                          style: AppStyles.smallRegularText,
                        ),
                        SizedBox(width: 20.w),
                        Container(
                          height: 30.h,
                          padding: EdgeInsets.all(5.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                color: AppColors.grayLighter, width: 1.5),
                          ),
                          child: InkWell(
                            onTap: () {
                              context.pushNamed(
                                Routes.orderDetails,
                                arguments: OrderDetailsArgument(
                                  orderCubit: context.read<OrdersCubit>(),
                                  order: orderModel,
                                ),
                              );
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 15.r,
                              color: AppColors.primaryDarker,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        orderModel.orderedAt.formatDate,
                        style: AppStyles.extraSmallRegularGrayLightText,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
