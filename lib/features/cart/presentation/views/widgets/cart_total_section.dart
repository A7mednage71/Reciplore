import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/cart/presentation/views/widgets/checkout_button.dart';

class CartTotalSection extends StatelessWidget {
  const CartTotalSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black26,
            blurRadius: 10.r,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total',
                  style: AppStyles.smallRegularText
                      .copyWith(color: AppColors.grayLight)),
              5.h.verticalSpace,
              Text(
                '\$ 20.00',
                style: AppStyles.largeBoldText
                    .copyWith(color: AppColors.primaryDark),
              )
            ],
          ),
          const Spacer(),
          const CheckoutButton()
        ],
      ),
    );
  }
}
