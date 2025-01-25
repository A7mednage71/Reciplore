import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/social_media_item.dart';

class SocialMediaSection extends StatelessWidget {
  const SocialMediaSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SocialMediaItem(logo: AppAssets.imagesInstagram),
        SizedBox(width: 10.w),
        const SocialMediaItem(logo: AppAssets.imagesDiscord),
        SizedBox(width: 10.w),
        const SocialMediaItem(logo: AppAssets.imagesFacebook),
        SizedBox(width: 10.w),
        const SocialMediaItem(logo: AppAssets.imagesTwitter),
      ],
    );
  }
}
