import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_rate.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/orders/data/models/get_orders_response_model.dart';
import 'package:looqma/features/orders/presentation/views/widgets/order_item_cached_image.dart';

class OrderDetailsIngredientItem extends StatelessWidget {
  const OrderDetailsIngredientItem({super.key, required this.ingredientModel});
  final OrderIngredientModel ingredientModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          color: AppColors.white,
          child: Padding(
            padding: EdgeInsets.all(10.r),
            child: Column(
              children: [
                Row(
                  children: [
                    OrderItemCachedImage(
                      image: ingredientModel.ingredientData.image.secureUrl,
                      width: 150.w,
                      height: 100.h,
                      withOutBackground: true,
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ingredientModel.ingredientData.name,
                            style: AppStyles.smallRegularText,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5.h),
                          Text(
                              '\$${ingredientModel.ingredientData.basePrice} each',
                              style: AppStyles.smallBoldText),
                          SizedBox(height: 5.h),
                          Text(
                              '\$${ingredientModel.quantity * ingredientModel.ingredientData.basePrice}',
                              style: AppStyles.smallBoldprimaryDarkText),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 10.w,
          top: 10.h,
          child: CustomRate(
              rate: "${ingredientModel.ingredientData.averageRating}"),
        ),
        Positioned(
          top: 7.h,
          left: 7.w,
          child: CircleAvatar(
            backgroundColor: AppColors.primaryDarker,
            radius: 12.r,
            child: Text(
              "${ingredientModel.quantity}",
              style: AppStyles.smallBoldWhiteText,
            ),
          ),
        ),
      ],
    );
  }
}
