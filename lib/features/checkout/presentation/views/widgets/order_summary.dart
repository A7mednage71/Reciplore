import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/checkout/data/models/cart_overview_response_model.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
    required this.cartOverview,
  });
  final CartOverviewResponseModel cartOverview;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h,
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
                Text("${cartOverview.subTotal}\$",
                    style: AppStyles.smallRegularText),
              ],
            ),
            Row(
              children: [
                Text("Discount", style: AppStyles.smallRegularText),
                const Spacer(),
                Text("${cartOverview.coupondiscount}\$",
                    style: AppStyles.smallRegularText),
              ],
            ),
            Row(
              children: [
                Text("Shipping Fee", style: AppStyles.smallRegularText),
                const Spacer(),
                Text("${cartOverview.shippingFee}\$",
                    style: AppStyles.smallRegularText),
              ],
            ),
            Row(
              children: [
                Text("Vat", style: AppStyles.smallRegularText),
                const Spacer(),
                Text("${cartOverview.vatAmount}\$",
                    style: AppStyles.smallRegularText),
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
                Text("${cartOverview.total}\$", style: AppStyles.smallBoldText),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
