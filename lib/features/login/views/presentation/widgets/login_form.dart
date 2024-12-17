import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/login/views/cubit/login_cubit.dart';
import 'package:looqma/features/login/views/presentation/widgets/email_text_form.dart';
import 'package:looqma/features/login/views/presentation/widgets/password_text_form.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late LoginCubit _cubit;
  @override
  void initState() {
    _cubit = context.read<LoginCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.emailController.dispose();
    _cubit.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _cubit.formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EmailTextForm(),
          SizedBox(height: 30.h),
          const PasswordTextForm()
        ],
      ),
    );
  }
}
