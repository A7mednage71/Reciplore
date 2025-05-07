import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:lottie/lottie.dart';

class ChatBotHome extends StatelessWidget {
  const ChatBotHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('ChatBot', style: AppStyles.mediumBoldText)),
            SizedBox(height: 10.h),
            Lottie.asset(AppAssets.imagesAnimation),
            Text(
              "Hi, I’m RecipeBot 👩‍🍳\n\n"
              "I’m here to be your personal cooking assistant.\n\n"
              "Tell me what ingredients you have,\n"
              "and I’ll help you whip up delicious meals in no time.\n\n"
              "Let’s create something tasty together! 🍲",
              style: AppStyles.smallRegularText,
            ),
            SizedBox(height: 70.h),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(Routes.chatScreen);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryDark,
                minimumSize: Size(200.w, 40.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                elevation: 2,
                shadowColor: Colors.grey,
              ),
              child: Text(
                "Start Chat",
                style: AppStyles.normalBoldWhiteText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
