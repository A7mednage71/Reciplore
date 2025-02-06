import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/update_user_info/update_user_info_form.dart';

class UpdateProfileInfo extends StatelessWidget {
  const UpdateProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Update Profile Info'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              const UpdateUserInfoForm(),
            ],
          ),
        ));
  }
}
