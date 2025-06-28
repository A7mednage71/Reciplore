import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/checkout/data/models/payment_method_model.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.isactive,
    required this.methodModel,
  });
  final bool isactive;
  final PaymentMethodModel methodModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 60.h,
          width: 100.w,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
              side: BorderSide(
                width: 2,
                color: isactive ? AppColors.primarybright : AppColors.grayLight,
              ),
            ),
          ),
          child: Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.r))),
              color: AppColors.white,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(5.r),
                child: SvgPicture.asset(
                  methodModel.image,
                  height: 50.h,
                  width: 50.w,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: !methodModel.isAvailable,
          child: Positioned(
            top: -5,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primarybright,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child:
                  Icon(Icons.access_time, color: AppColors.white, size: 18.r),
            ),
          ),
        ),
      ],
    );
  }
}
