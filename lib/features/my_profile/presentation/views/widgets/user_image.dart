import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 43.r,
          backgroundColor: AppColors.primaryDarker,
          child: CircleAvatar(
            radius: 40.r,
            backgroundImage: const AssetImage(
              AppAssets.imagesUserProfile,
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: InkWell(
            onTap: () {},
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              width: 24.w,
              height: 24.w,
              decoration: const BoxDecoration(
                color: AppColors.primaryMedium,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Icon(Icons.edit),
            ),
          ),
        ),
      ],
    );
  }
}
