import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/features/checkout/data/models/payment_method_model.dart';
import 'package:looqma/features/checkout/presentation/cubit/checkout/checkout_cubit.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/payment_method_item.dart';

class PaymentMethodslistView extends StatefulWidget {
  const PaymentMethodslistView({
    super.key,
  });

  @override
  State<PaymentMethodslistView> createState() => _PaymentMethodslistViewState();
}

class _PaymentMethodslistViewState extends State<PaymentMethodslistView> {
  List<PaymentMethodModel> paymentmethodsitems = [
    PaymentMethodModel(
      image: AppAssets.imagesMastercard,
      name: "stripe",
    ),
    PaymentMethodModel(
      image: AppAssets.imagesPaymob,
      name: "Paymob",
      isAvailable: false,
    ),
    PaymentMethodModel(
      image: AppAssets.imagesPaypal,
      name: "Paypal",
      isAvailable: false,
    ),
    PaymentMethodModel(
      image: AppAssets.imagesMoneyOnDelievery,
      name: "cash",
    ),
  ];

  int isactive = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentmethodsitems.length,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              if (paymentmethodsitems[index].isAvailable == false) {
                ShowToast.showFailureToast(
                    '${paymentmethodsitems[index].name} is Not Available Right Now');
                return;
              }
              setState(() {
                isactive = index;
              });
              await context.read<CheckoutCubit>().setPaymentMethod(
                  paymentMethod: paymentmethodsitems[index].name);
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.only(left: index == 0 ? 0 : 15.w),
              child: PaymentMethodItem(
                isactive: isactive == index,
                methodModel: paymentmethodsitems[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
