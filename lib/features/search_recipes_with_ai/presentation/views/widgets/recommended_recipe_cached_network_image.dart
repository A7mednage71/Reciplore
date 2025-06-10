import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecommendedRecipeCachedNetworkImage extends StatelessWidget {
  const RecommendedRecipeCachedNetworkImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: 250.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        placeholder: (context, url) {
          return Skeletonizer(
            enabled: true,
            child: Container(
              height: 250.h,
              width: double.infinity,
              color: AppColors.white,
            ),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: 250.h,
            width: double.infinity,
            color: AppColors.grayLighter,
            child: const Icon(Icons.error, size: 50, color: Colors.red),
          );
        });
  }
}
