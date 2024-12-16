import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/core/utils/my_validator.dart';

class PhoneTextFormField extends StatelessWidget {
  const PhoneTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Phone", style: AppStyles.smallRegularText),
        SizedBox(height: 5.h),
        CustomTextField(
          controller: TextEditingController(),
          validator: MyValidators.phoneNumberValidator,
          keyboardType: TextInputType.phone,
          hintText: "Enter Phone",
        ),
      ],
    );
  }
}
