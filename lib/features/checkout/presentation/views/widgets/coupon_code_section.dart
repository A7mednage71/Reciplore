import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/core/utils/my_validator.dart';
import 'package:looqma/features/checkout/presentation/cubit/checkout/checkout_cubit.dart';

class CouponCodeSection extends StatefulWidget {
  const CouponCodeSection({
    super.key,
  });

  @override
  State<CouponCodeSection> createState() => _CouponCodeSectionState();
}

class _CouponCodeSectionState extends State<CouponCodeSection> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController couponCodeController;

  @override
  void initState() {
    couponCodeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    couponCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Coupon Code", style: AppStyles.smallBoldText),
        SizedBox(height: 5.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: CustomTextField(
                  controller: couponCodeController,
                  validator: MyValidators.couponValidator,
                  keyboardType: TextInputType.text,
                  hintText: "Enter Coupon Code",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            BlocConsumer<CheckoutCubit, CheckoutState>(
              listenWhen: (context, state) =>
                  state.couponStatus == CouponCodeStatus.failure,
              listener: (context, state) {
                ShowToast.showFailureToast(state.checkCouponMessage ?? '');
              },
              buildWhen: (previous, current) =>
                  previous.couponStatus != current.couponStatus,
              builder: (context, state) {
                if (state.couponStatus == CouponCodeStatus.loading) {
                  return Container(
                      width: 60.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: SpinKitFadingCircle(
                            color: AppColors.white, size: 20.r),
                      ));
                } else {
                  return InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        final checkoutCubit = context.read<CheckoutCubit>();
                        final state = checkoutCubit.state;
                        if (state.couponCode == null) {
                          await checkoutCubit.checkCoupon(
                              code: couponCodeController.text.trim());
                        } else {
                          ShowToast.showFailureToast(
                              'An Coupon is already applied');
                        }
                      }
                    },
                    child: Container(
                      width: 60.w,
                      height: 45.h,
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
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
