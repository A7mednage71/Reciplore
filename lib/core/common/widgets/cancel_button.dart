import 'package:flutter/material.dart';
import 'package:looqma/core/utils/app_styles.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
    this.onPressed,
  });
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: onPressed ?? () => Navigator.of(context).pop(),
        child: Text('Cancel', style: AppStyles.extraSmallBoldWarningText),
      ),
    );
  }
}
