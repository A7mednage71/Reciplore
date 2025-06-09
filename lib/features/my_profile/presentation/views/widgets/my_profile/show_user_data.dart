import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/extensions/string_ex.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/checkout/data/models/address_model.dart';
import 'package:looqma/features/my_profile/data/models/user_profile_response_model.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/my_profile/user_data_item.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/my_profile/user_image_section.dart';

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
        UserImageSection(
            userImage: userProfileModel?.profileImage?.secureProfileUrl),
        SizedBox(height: 10.h),
        Text(
          userProfileModel?.userName.capitalizeEachWord ?? "User Name",
          style: AppStyles.mediumBoldText,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 10.h),
        UserDataItem(
          icon: Icons.email,
          content: userProfileModel?.email ?? "Looqma_App@gmail.com",
        ),
        SizedBox(height: 5.h),
        UserDataItem(
          icon: Icons.phone,
          content: userProfileModel?.phoneNumbers.first ?? "1234567890",
        ),
        SizedBox(height: 5.h),
        if (userProfileModel?.userAddresses.isNotEmpty ?? false)
          UserDataItem(
            icon: Icons.location_on_outlined,
            content: formataddress() ?? "123 Main Street, Cairo, Egypt",
          ),
        SizedBox(height: 5.h),
        if (userProfileModel?.userAge != null)
          UserDataItem(
            icon: Icons.date_range,
            content: userProfileModel?.userAge.toString() ?? "00",
          )
      ],
    );
  }

  String? formataddress() {
    if (userProfileModel?.userAddresses.isNotEmpty ?? false) {
      final AddressModel address = userProfileModel!.userAddresses.first;
      return "${address.streetName}, ${address.city}, ${address.country}";
    }
    return null;
  }
}
