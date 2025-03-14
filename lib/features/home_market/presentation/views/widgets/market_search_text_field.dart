import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_assets.dart';

class MarketSearchTextField extends StatelessWidget {
  const MarketSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: TextEditingController(),
      validator: null,
      onChanged: (value) => null,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      keyboardType: TextInputType.text,
      prefixIcon: Image.asset(
        AppAssets.imagesSearchIcon,
        height: 20.h,
        width: 20.w,
      ),
      hintText: "Search for ingredients...",
      readOnly: true,
      onTap: () {},
    );
  }
}
