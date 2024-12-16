import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/sigh_up/presentation/widgets/already_have_account.dart';
import 'package:looqma/features/sigh_up/presentation/widgets/sighn_up_form.dart';
import 'package:looqma/features/sigh_up/presentation/widgets/sighn_up_top_info.dart';
import 'package:looqma/features/sigh_up/presentation/widgets/sign_up_button.dart';

class SighnUpScreen extends StatelessWidget {
  const SighnUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            const SighnUpTopInfo(),
            SizedBox(height: 10.h),
            const SignUpForm(),
            SizedBox(height: 20.h),
            const SignUpButton(),
            SizedBox(height: 20.h),
            const AleardyHaveAccount()
          ],
        ),
      ),
    ));
  }
}
