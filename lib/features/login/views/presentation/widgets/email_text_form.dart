import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/core/utils/my_validator.dart';
import 'package:looqma/features/login/views/cubit/login_cubit.dart';

class EmailTextForm extends StatelessWidget {
  const EmailTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email", style: AppStyles.smallRegularText),
        SizedBox(height: 5.h),
        CustomTextField(
          controller: context.read<LoginCubit>().emailController,
          validator: MyValidators.emailValidator,
          keyboardType: TextInputType.emailAddress,
          hintText: "Enter Email",
        ),
      ],
    );
  }
}
