import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class StartCookingButton extends StatelessWidget {
  const StartCookingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.login);
      },
      child: Container(
        width: 243.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: AppColors.primaryDark,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Start Cooking",
              style: AppStyles.normalBoldText.copyWith(color: Colors.white),
            ),
            SizedBox(width: 9.w),
            const Icon(Icons.arrow_forward, color: Colors.white)
          ],
        )),
      ),
    );
  }
}
