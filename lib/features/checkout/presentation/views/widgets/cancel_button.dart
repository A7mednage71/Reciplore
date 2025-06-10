import 'package:flutter/material.dart';
import 'package:looqma/core/utils/app_styles.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: Text('Cancel', style: AppStyles.extraSmallBoldprimaryDarkerText),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
