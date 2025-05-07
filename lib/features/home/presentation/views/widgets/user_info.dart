import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/extensions/string_ex.dart';
import 'package:looqma/core/services/secure_storage/secure_storage.dart';
import 'package:looqma/core/services/secure_storage/secure_storage_keys.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  String userName = "";
  @override
  void initState() {
    getUserName();
    super.initState();
  }

  Future<void> getUserName() async {
    String name =
        await SecureStorage.getSecuredData(SecureStorageKeys.userName);
    setState(() {
      userName = name;
    });
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
              Text("Hello ${userName.isEmpty ? "" : userName.firstName}",
                  style: AppStyles.largeBoldText),
              SizedBox(height: 5.h),
              Text("What are you cooking today?",
                  style: AppStyles.smallRegularGrayLightText),
            ],
          ),
          const Spacer(),
          Container(
            width: 40.w,
            height: 40.w,
            decoration: const BoxDecoration(
              color: AppColors.secondaryLight,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage(AppAssets.imagesUserImage),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
