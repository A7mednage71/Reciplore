import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/checkout/presentation/cubit/checkout/checkout_cubit.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/add_new_address_widget.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/contact_number_section.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/coupon_code_section.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/delivery_addresses_bloc_builder.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/order_summary_bloc_builder.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/payment_methods_listview.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/place_order_and_pay_button.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Checkout'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: RefreshIndicator(
          onRefresh: () async =>
              context.read<CheckoutCubit>().getCartOverview(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Text(" Chose Payment Method", style: AppStyles.smallBoldText),
                SizedBox(height: 10.h),
                const PaymentMethodslistView(),
                SizedBox(height: 20.h),
                Text("Delivery Address", style: AppStyles.smallBoldText),
                SizedBox(height: 5.h),
                const DeliveryAddressesBlocBuilder(),
                const AddNewAddressWidget(),
                const ContactNumberSection(),
                SizedBox(height: 20.h),
                const CouponCodeSection(),
                SizedBox(height: 20.h),
                Text("Order Summary", style: AppStyles.smallBoldText),
                SizedBox(height: 5.h),
                const OrderSummaryBlocBuilder(),
                SizedBox(height: 20.h),
                const PlaceOrderAndPayButton(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
