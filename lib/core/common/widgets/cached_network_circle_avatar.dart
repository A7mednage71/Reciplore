import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_constants.dart';
import 'package:shimmer/shimmer.dart';

class CachedNetworkCircleAvatar extends StatelessWidget {
  const CachedNetworkCircleAvatar({
    super.key,
    required this.image,
    this.radius,
  });

  final String? image;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image ?? AppConstants.defaultRecipeItemImage,
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          radius: radius ?? 40.r,
          backgroundColor: Colors.transparent,
          backgroundImage: imageProvider,
        );
      },
      fit: BoxFit.fill,
      errorWidget: (context, url, error) {
        return CircleAvatar(
          radius: radius ?? 40.r,
          backgroundColor: Colors.transparent,
          backgroundImage:
              const AssetImage(AppConstants.defaultRecipeItemImage),
        );
      },
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: AppColors.loadingColor,
          highlightColor: AppColors.white,
          child: CircleAvatar(
            radius: radius ?? 40.r,
            backgroundColor: AppColors.loadingColor,
            backgroundImage:
                const AssetImage(AppConstants.defaultRecipeItemImage),
          ),
        );
      },
    );
  }
}
