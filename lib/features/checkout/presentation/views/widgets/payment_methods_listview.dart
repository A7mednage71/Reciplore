import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/payment_method_item.dart';

class PaymentMethodslistView extends StatefulWidget {
  const PaymentMethodslistView({
    super.key,
  });

  @override
  State<PaymentMethodslistView> createState() => _PaymentMethodslistViewState();
}

class _PaymentMethodslistViewState extends State<PaymentMethodslistView> {
  List<String> paymentmethodsitems = [
    AppAssets.imagesMastercard,
    AppAssets.imagesPaymob,
    AppAssets.imagesPaypal,
    AppAssets.imagesMoneyOnDelievery,
  ];

  int isactive = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentmethodsitems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                isactive = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: index == 0 ? 0 : 15.w),
              child: PaymentMethodItem(
                isactive: isactive == index,
                image: paymentmethodsitems[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
