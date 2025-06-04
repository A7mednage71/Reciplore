import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:looqma/core/utils/app_colors.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.isactive,
    required this.image,
  });
  final bool isactive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
        shadows: [
          BoxShadow(
            color: isactive ? AppColors.primarybright : AppColors.white,
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
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
              image,
              height: 50.h,
              width: 50.w,
            ),
          ),
        ),
      ),
    );
  }
}
