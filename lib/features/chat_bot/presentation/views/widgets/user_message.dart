import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({super.key});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(15.r),
        margin: EdgeInsets.all(10.r),
        constraints: BoxConstraints(
          maxWidth: 250.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryDarker,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18).w,
            topRight: const Radius.circular(18).w,
            bottomLeft: const Radius.circular(18).w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: MarkdownBody(
          selectable: true,
          data: "user message text text text ",
          styleSheet: MarkdownStyleSheet(
            p: AppStyles.smallRegularText,
          ),
        ),
      ),
    );
  }
}
