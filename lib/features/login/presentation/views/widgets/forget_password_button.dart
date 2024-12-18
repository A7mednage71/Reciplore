import 'package:flutter/material.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.forgetPassword);
      },
      child: Text(
        "Forget Password?",
        style: AppStyles.smallRegularText.copyWith(
          color: AppColors.secondaryDark,
        ),
      ),
    );
  }
}
