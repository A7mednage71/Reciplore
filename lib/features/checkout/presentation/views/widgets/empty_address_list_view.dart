import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class EmptyAddressListWidget extends StatelessWidget {
  const EmptyAddressListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.grayLighter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: ListTile(
        leading: Icon(Icons.location_off_outlined, size: 30.r),
        title: Text("No Address Found, please add one..!",
            style: AppStyles.smallBoldText, textAlign: TextAlign.center),
      ),
    );
  }
}
