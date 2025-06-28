import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_styles.dart';

class OrderDetailsSummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const OrderDetailsSummaryRow(
      {super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.5.h),
      child: Row(
        children: [
          Text('$label :', style: AppStyles.smallBoldText),
          const Spacer(),
          Text(value, style: AppStyles.smallRegularText),
        ],
      ),
    );
  }
}
