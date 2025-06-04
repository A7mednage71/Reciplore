import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
        color: AppColors.grayLighter,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text("Subtotal", style: AppStyles.smallRegularText),
                const Spacer(),
                Text("100\$", style: AppStyles.smallRegularText),
              ],
            ),
            Row(
              children: [
                Text("Delivery", style: AppStyles.smallRegularText),
                const Spacer(),
                Text("10\$", style: AppStyles.smallRegularText),
              ],
            ),
            Row(
              children: [
                Text("Discount", style: AppStyles.smallRegularText),
                const Spacer(),
                Text("10\$", style: AppStyles.smallRegularText),
              ],
            ),
            const Divider(
              color: AppColors.grayLight,
              thickness: 1,
            ),
            Row(
              children: [
                Text("Total", style: AppStyles.smallBoldText),
                const Spacer(),
                Text("110\$", style: AppStyles.smallBoldText),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
