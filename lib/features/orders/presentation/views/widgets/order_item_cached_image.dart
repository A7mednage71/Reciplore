import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class OrderItemCachedImage extends StatelessWidget {
  const OrderItemCachedImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: 75.h,
          width: 75.w,
          decoration: BoxDecoration(
            color: AppColors.grayMediumlight,
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            border: Border.all(color: AppColors.grayLighter, width: 3),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: AppColors.loadingColor,
          highlightColor: AppColors.white,
          child: Container(
            height: 75.h,
            width: 75.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              color: AppColors.loadingColor,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) => Center(
        child: Container(
          height: 75.h,
          width: 75.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
          ),
          child: const Icon(
            Icons.error,
            color: AppColors.red,
          ),
        ),
      ),
    );
  }
}
