import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class NewChatDailog extends StatelessWidget {
  const NewChatDailog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
        side: const BorderSide(color: AppColors.grayLight),
      ),
      title: Text(
        "New Chat",
        style: AppStyles.mediumBoldText,
      ),
      content: Text(
        "Are you sure you want to start a new chat ?",
        style: AppStyles.smallRegularText,
      ),
      actions: [
        TextButton(
          child: Text('Cancel',
              style: AppStyles.extraSmallBoldText.copyWith(color: Colors.blue)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          onPressed: () {},
          child: Text('OK', style: AppStyles.extraSmallBoldWarningText),
        ),
      ],
    );
  }
}
