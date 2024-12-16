import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/login/presentation/widgets/donot_have_account.dart';
import 'package:looqma/features/login/presentation/widgets/forget_password_button.dart';
import 'package:looqma/features/login/presentation/widgets/login_form.dart';
import 'package:looqma/features/login/presentation/widgets/sighn_in_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 90.h),
            Text("Hello,", style: AppStyles.headerBoldText),
            Text("Welcome Back!", style: AppStyles.largeRegularText),
            SizedBox(height: 50.h),
            const LoginForm(),
            SizedBox(height: 10.h),
            const ForgetPasswordButton(),
            SizedBox(height: 20.h),
            const SignInButton(),
            SizedBox(height: 50.h),
            const DonotHaveAccount()
          ],
        ),
      ),
    ));
  }
}
