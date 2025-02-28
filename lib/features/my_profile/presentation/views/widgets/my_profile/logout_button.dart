import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/my_profile/logout_alert_dialog.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => const LogoutAlertDialog(),
        );
      },
      child: Container(
        height: 40.h,
        width: 174.w,
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            "Logout",
            style: AppStyles.smallBoldText.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
