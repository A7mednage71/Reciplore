import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/chat_bot/data/models/chat_message.dart';

class AssistantMessage extends StatelessWidget {
  final ChatMessage message;

  const AssistantMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(15.r),
        margin: EdgeInsets.all(10.r),
        constraints: BoxConstraints(
          maxWidth: 250.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18).w,
            topRight: const Radius.circular(18).w,
            bottomRight: const Radius.circular(18).w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(76),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CachedNetworkImage(
                imageUrl: message.imageUrl ?? '',
                width: double.infinity,
                height: 200.h,
                fit: BoxFit.cover,
                fadeInDuration: const Duration(milliseconds: 300),
                placeholder: (context, url) => Container(
                  width: double.infinity,
                  height: 200.h,
                  alignment: Alignment.center,
                  child: const SpinKitCircle(color: AppColors.primaryDark),
                ),
                errorWidget: (context, eror, url) => Container(
                  width: double.infinity,
                  height: 200.h,
                  color: AppColors.grayMediumlight,
                  alignment: Alignment.center,
                  child: const Icon(Icons.broken_image, color: AppColors.red),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            MarkdownBody(
              selectable: true,
              data: message.content,
              styleSheet: MarkdownStyleSheet(
                p: AppStyles.smallRegularText,
                a: AppStyles.smallBoldText,
                h1: AppStyles.mediumBoldText,
                h2: AppStyles.mediumBoldText
                    .copyWith(color: AppColors.primaryDarker),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
