import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/my_profile/social_media_section.dart';

class JoinCommunityWidget extends StatelessWidget {
  const JoinCommunityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.grayLighter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Community",
              style: AppStyles.smallBoldText,
            ),
            Text(
              "Join us to discover and share amazing recipes together!",
              style: AppStyles.extraSmallRegularGrayMediumText,
            ),
            SizedBox(height: 10.h),
            Text("Join us now!", style: AppStyles.extraSmallBoldText),
            SizedBox(height: 10.h),
            const SocialMediaSection(),
          ],
        ),
      ),
    );
  }
}
