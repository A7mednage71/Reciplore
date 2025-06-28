import 'package:flutter/material.dart';
import 'package:looqma/core/utils/app_styles.dart';

class OrderDeliveryAddressRow extends StatelessWidget {
  final String label;
  final String value;

  const OrderDeliveryAddressRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "$label : ",
        style: AppStyles.smallBoldText,
        children: [
          TextSpan(
            text: value,
            style: AppStyles.smallRegularText,
          ),
        ],
      ),
    );
  }
}
