import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/features/change_password/presentation/views/widgets/change_password_button.dart';
import 'package:looqma/features/change_password/presentation/views/widgets/change_password_form.dart';
import 'package:lottie/lottie.dart';

class ChangeUserPassword extends StatelessWidget {
  const ChangeUserPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Change Password'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset(
                AppAssets.imagesChangePassword,
                height: 180.h,
                width: 200.w,
              ),
              SizedBox(height: 10.h),
              const ChangePasswordForm(),
              SizedBox(height: 50.h),
              const ChangePasswordButton(),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
