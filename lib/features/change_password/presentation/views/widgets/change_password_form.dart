import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/change_password/presentation/cubit/change_password/change_password_cubit.dart';
import 'package:looqma/features/change_password/presentation/views/widgets/confirm_password_text_form.dart';
import 'package:looqma/features/change_password/presentation/views/widgets/new_password_text_form.dart';
import 'package:looqma/features/change_password/presentation/views/widgets/old_password_text_form.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({
    super.key,
  });

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ChangePasswordCubit>().formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OldPasswordTextForm(),
          SizedBox(height: 20.h),
          const NewPasswordTextForm(),
          SizedBox(height: 20.h),
          const ConfirmPasswordTextForm(),
        ],
      ),
    );
  }
}
