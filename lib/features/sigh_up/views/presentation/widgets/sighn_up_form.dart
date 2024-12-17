import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/sigh_up/views/presentation/widgets/confirm_password_text_field.dart';
import 'package:looqma/features/sigh_up/views/presentation/widgets/phone_text_form_field.dart';
import 'package:looqma/features/sigh_up/views/presentation/widgets/sign_up_email_text_field.dart';
import 'package:looqma/features/sigh_up/views/presentation/widgets/sign_up_password_text_field.dart';
import 'package:looqma/features/sigh_up/views/presentation/widgets/user_text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
