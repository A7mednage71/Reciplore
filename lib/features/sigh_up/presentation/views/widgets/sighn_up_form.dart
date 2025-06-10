import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/sigh_up/presentation/cubit/sighn_up_cubit.dart';
import 'package:looqma/features/sigh_up/presentation/views/widgets/confirm_password_text_field.dart';
import 'package:looqma/features/sigh_up/presentation/views/widgets/phone_text_form_field.dart';
import 'package:looqma/features/sigh_up/presentation/views/widgets/sign_up_email_text_field.dart';
import 'package:looqma/features/sigh_up/presentation/views/widgets/sign_up_password_text_field.dart';
import 'package:looqma/features/sigh_up/presentation/views/widgets/user_text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late SighnUpCubit _cubit;
  @override
  void initState() {
    _cubit = context.read<SighnUpCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.emailController.dispose();
    _cubit.passwordController.dispose();
    _cubit.confirmPasswordController.dispose();
    _cubit.nameController.dispose();
    _cubit.phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SighnUpCubit>().formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          const UserTextFormField(),
          SizedBox(height: 20.h),
          const SignUpEmailTextFormField(),
          SizedBox(height: 20.h),
          const PhoneTextFormField(),
          SizedBox(height: 20.h),
          const SignUpPasswordTextField(),
          SizedBox(height: 20.h),
          const ConfirmPasswordTextField(),
        ],
      ),
    );
  }
}
