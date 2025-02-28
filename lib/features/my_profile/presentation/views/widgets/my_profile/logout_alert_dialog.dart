import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/services/secure_storage/secure_storage.dart';
import 'package:looqma/core/services/secure_storage/secure_storage_keys.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:lottie/lottie.dart';

class LogoutAlertDialog extends StatelessWidget {
  const LogoutAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
          side: const BorderSide(color: AppColors.grayLight),
        ),
        title: Text(
          "Logout",
          style: AppStyles.mediumBoldText,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              AppAssets.imagesWorningLottie,
              height: 100.h,
            ),
            Text(
              "Are you sure you want to logout ?",
              style: AppStyles.smallRegularText,
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Cancel',
                style: AppStyles.extraSmallBoldText
                    .copyWith(color: AppColors.primaryDarker)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Logout',
                style:
                    AppStyles.extraSmallBoldText.copyWith(color: Colors.red)),
            onPressed: () async {
              await SecureStorage.removeSecuredData(
                  SecureStorageKeys.accessToken);
              await SecureStorage.removeSecuredData(
                  SecureStorageKeys.refreshToken);
              if (context.mounted) {
                context.pushReplacementNamed(Routes.login);
              }
            },
          ),
        ]);
  }
}
