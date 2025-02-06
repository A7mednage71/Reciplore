import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/update_profile_info/update_profile_info_button.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/update_profile_info/update_profile_info_form.dart';
import 'package:lottie/lottie.dart';

class UpdateProfileInfo extends StatelessWidget {
  const UpdateProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Update Profile Info'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Lottie.asset(
                  AppAssets.imagesUpdateProfile,
                  height: 180.h,
                  width: 200.w,
                ),
                SizedBox(height: 10.h),
                const UpdateProfileInfoForm(),
                SizedBox(height: 10.h),
                const UpdateProfileInfoButton(),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ));
  }
}
