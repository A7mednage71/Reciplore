import 'package:flutter/material.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/routes/routes.dart';
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
          onPressed: () {
            context.pushReplacementNamed(Routes.sighnUp);
          },
          child: Text(
            "Sign Up",
            style: AppStyles.smallBoldsecondaryDarkText,
          ),
        )
      ],
    );
  }
}
