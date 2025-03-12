import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/cart/presentation/views/widgets/update_amount_of_cart_item.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.2,
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: AppColors.red,
              foregroundColor: AppColors.white,
              icon: Icons.clear,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            border: Border.all(color: AppColors.grayLighter, width: 1.5.w),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.imagesIngrediant,
                  width: 100.w,
                  height: 100.h,
                ),
                10.w.horizontalSpace,
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Baby Plum Tomatoes',
                        style: AppStyles.smallBoldText,
                      ),
                      5.h.verticalSpace,
                      Text(
                        '1kg, Price',
                        style: AppStyles.smallRegularText
                            .copyWith(color: AppColors.grayLight),
                      ),
                      10.h.verticalSpace,
                      Text(
                        '\$20.00',
                        style: AppStyles.smallBoldText
                            .copyWith(color: AppColors.primaryDark),
                      ),
                    ],
                  ),
                ),
                5.w.horizontalSpace,
                const UpdateAmountOfCartItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
