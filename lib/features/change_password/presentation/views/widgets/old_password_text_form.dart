import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class OldPasswordTextForm extends StatefulWidget {
  const OldPasswordTextForm({super.key});

  @override
  State<OldPasswordTextForm> createState() => _OldPasswordTextFormState();
}

class _OldPasswordTextFormState extends State<OldPasswordTextForm> {
  bool obscureOldpassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Old Password", style: AppStyles.smallRegularText),
        SizedBox(height: 10.h),
        CustomTextField(
            controller: TextEditingController(),
            hintText: 'Enter old Password',
            obscureText: obscureOldpassword,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your old password';
              }
              return null;
            },
            suffixIcon: IconButton(
              color: AppColors.grayLight,
              icon: Icon(
                  obscureOldpassword ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  obscureOldpassword = !obscureOldpassword;
                });
              },
            ))
      ],
    );
  }
}
