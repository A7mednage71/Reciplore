import 'package:flutter/material.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class AleardyHaveAccount extends StatelessWidget {
  const AleardyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account? ", style: AppStyles.smallRegularText),
        TextButton(
          onPressed: () {},
          child: Text(
            "Sign In",
            style: AppStyles.smallBoldText
                .copyWith(color: AppColors.secondaryDark),
          ),
        ),
      ],
    );
  }
}
