import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/core/utils/my_validator.dart';

class ConfirmPasswordTextForm extends StatefulWidget {
  const ConfirmPasswordTextForm({super.key});

  @override
  State<ConfirmPasswordTextForm> createState() =>
      _ConfirmPasswordTextFormState();
}

class _ConfirmPasswordTextFormState extends State<ConfirmPasswordTextForm> {
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Confirm Password", style: AppStyles.smallRegularText),
        SizedBox(height: 5.h),
        CustomTextField(
          controller: TextEditingController(),
          hintText: 'Confirm Password',
          validator: (value) {
            // String password =
            //     context.read<SighnUpCubit>().passwordController.text;
            return MyValidators.repeatPasswordValidator(
                password: "password", value: value);
          },
          keyboardType: TextInputType.visiblePassword,
          obscureText: obscureConfirmPassword,
          suffixIcon: IconButton(
            color: AppColors.grayLight,
            icon: Icon(obscureConfirmPassword
                ? Icons.visibility_off
                : Icons.visibility),
            onPressed: () {
              setState(() {
                obscureConfirmPassword = !obscureConfirmPassword;
              });
            },
          ),
        )
      ],
    );
  }
}
