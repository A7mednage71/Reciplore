import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/core/utils/my_validator.dart';
import 'package:looqma/features/sigh_up/presentation/cubit/sighn_up_cubit.dart';

class SignUpPasswordTextField extends StatefulWidget {
  const SignUpPasswordTextField({super.key});

  @override
  State<SignUpPasswordTextField> createState() =>
      _SignUpPasswordTextFieldState();
}

class _SignUpPasswordTextFieldState extends State<SignUpPasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password", style: AppStyles.smallRegularText),
        SizedBox(height: 5.h),
        CustomTextField(
          controller: context.read<SighnUpCubit>().passwordController,
          validator: MyValidators.passwordValidator,
          keyboardType: TextInputType.visiblePassword,
          hintText: "Enter Password",
          obscureText: obscureText,
          suffixIcon: IconButton(
            color: AppColors.grayLight,
            icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
        ),
      ],
    );
  }
}
