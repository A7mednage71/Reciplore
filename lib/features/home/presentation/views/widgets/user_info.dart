import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/extensions/string_ex.dart';
import 'package:looqma/core/services/notifiers/user_data_notifier.dart';
import 'package:looqma/core/services/secure_storage/secure_storage.dart';
import 'package:looqma/core/services/secure_storage/secure_storage_keys.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:lottie/lottie.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  void initState() {
    getUserName();
    super.initState();
  }

  Future<void> getUserName() async {
    String name =
        await SecureStorage.getSecuredData(SecureStorageKeys.userName);
    UserDataNotifier.userNameNotifier.value = name;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder(
                valueListenable: UserDataNotifier.userNameNotifier,
                builder: (context, name, child) => Text(
                    "Hello ${name.isEmpty ? "Foodie" : name.firstName} 👋",
                    style: AppStyles.largeBoldText),
              ),
              SizedBox(height: 5.h),
              Text("What are you cooking today?",
                  style: AppStyles.smallRegularGrayLightText),
            ],
          ),
          const Spacer(),
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.secondaryLight,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Lottie.asset(
                AppAssets.imagesCookingLottie,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
