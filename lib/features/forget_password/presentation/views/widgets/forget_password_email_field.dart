import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/core/utils/my_validator.dart';
import 'package:looqma/features/forget_password/presentation/cubit/forget_password_cubit.dart';

class ForgetPasswordEmailField extends StatefulWidget {
  const ForgetPasswordEmailField({super.key});

  @override
  State<ForgetPasswordEmailField> createState() =>
      _ForgetPasswordEmailFieldState();
}

class _ForgetPasswordEmailFieldState extends State<ForgetPasswordEmailField> {
  late ForgetPasswordCubit _cubit;
  @override
  void initState() {
    _cubit = context.read<ForgetPasswordCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ForgetPasswordCubit>().formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your Email", style: AppStyles.smallRegularText),
          SizedBox(height: 5.h),
          CustomTextField(
            controller: TextEditingController(),
            validator: MyValidators.emailValidator,
            keyboardType: TextInputType.emailAddress,
            hintText: "Enter Email",
          ),
        ],
      ),
    );
  }
}
