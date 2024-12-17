import 'package:flutter/material.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class DonotHaveAccount extends StatelessWidget {
  const DonotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: AppStyles.smallRegularText,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Sign Up",
            style: AppStyles.smallBoldText
                .copyWith(color: AppColors.secondaryDark),
          ),
        )
      ],
    );
  }
}
