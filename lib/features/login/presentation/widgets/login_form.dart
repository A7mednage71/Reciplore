import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/login/presentation/widgets/email_text_form.dart';
import 'package:looqma/features/login/presentation/widgets/password_text_form.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
