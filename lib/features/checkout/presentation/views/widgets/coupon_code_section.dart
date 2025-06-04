import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/core/utils/my_validator.dart';

class CouponCodeSection extends StatelessWidget {
  const CouponCodeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Coupon Code", style: AppStyles.smallBoldText),
        SizedBox(height: 5.h),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: TextEditingController(),
                validator: MyValidators.couponValidator,
                keyboardType: TextInputType.text,
                hintText: "Enter Coupon Code",
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              ),
            ),
            SizedBox(width: 10.w),
            InkWell(
              onTap: () {},
              child: Container(
                width: 60.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryDark,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    "Apply",
                    style: AppStyles.smallRegularWhiteText,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
