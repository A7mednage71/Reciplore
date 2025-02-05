import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/my_profile/data/models/user_profile_response_model.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/user_image.dart';

class ShowUserData extends StatelessWidget {
  const ShowUserData({
    super.key,
    this.userProfileModel,
  });
  final UserProfileResponseModel? userProfileModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UserImage(
            userImage:
                userProfileModel?.profileImage?.secureProfileUrl),
        SizedBox(height: 10.h),
        Text(
          userProfileModel?.userName ?? "User Name",
          style: AppStyles.mediumBoldText,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.email, color: AppColors.primaryMedium),
            SizedBox(width: 10.w),
            Text(userProfileModel?.email ?? "BenNageh@gmail.com",
                style: AppStyles.smallRegularText
                    .copyWith(color: AppColors.grayMedium)),
          ],
        ),
        SizedBox(height: 5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.phone, color: AppColors.primaryMedium),
            SizedBox(width: 10.w),
            Text(userProfileModel?.phoneNumbers.first ?? "1234567890",
                style: AppStyles.smallRegularText
                    .copyWith(color: AppColors.grayMedium)),
          ],
        ),
        SizedBox(height: 5.h),
        if (userProfileModel?.userAddresses.isNotEmpty ?? false)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on_outlined,
                  color: AppColors.primaryMedium),
              SizedBox(width: 10.w),
              Text(
                  userProfileModel?.userAddresses.first ??
                      "123 Main Street, Cairo, Egypt",
                  style: AppStyles.smallRegularText
                      .copyWith(color: AppColors.grayMedium)),
            ],
          ),
        SizedBox(height: 5.h),
        if (userProfileModel?.userAddresses.isNotEmpty ?? false)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.date_range, color: AppColors.primaryMedium),
              SizedBox(width: 10.w),
              Text(userProfileModel?.userAddresses.first ?? "50",
                  style: AppStyles.smallRegularText
                      .copyWith(color: AppColors.grayMedium)),
            ],
          ),
      ],
    );
  }
}
