import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/core/utils/my_validator.dart';
import 'package:looqma/features/change_password/presentation/cubit/change_password/change_password_cubit.dart';

class NewPasswordTextForm extends StatefulWidget {
  const NewPasswordTextForm({super.key});

  @override
  State<NewPasswordTextForm> createState() => _NewPasswordTextFormState();
}

class _NewPasswordTextFormState extends State<NewPasswordTextForm> {
  bool obscureNewPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("New Password", style: AppStyles.smallRegularText),
        SizedBox(height: 5.h),
        CustomTextField(
          controller: context.read<ChangePasswordCubit>().newPasswordController,
          hintText: 'Enter New Password',
          validator: MyValidators.passwordValidator,
          keyboardType: TextInputType.visiblePassword,
          obscureText: obscureNewPassword,
          suffixIcon: IconButton(
            color: AppColors.grayLight,
            icon: Icon(
                obscureNewPassword ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                obscureNewPassword = !obscureNewPassword;
              });
            },
          ),
        )
      ],
    );
  }
}
