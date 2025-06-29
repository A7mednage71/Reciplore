import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class OrderItemCachedImage extends StatelessWidget {
  const OrderItemCachedImage(
      {super.key,
      required this.image,
      this.width,
      this.height,
      this.withOutBackground = false});
  final String image;
  final double? width;
  final double? height;
  final bool withOutBackground;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height ?? 75.h,
          width: width ?? 75.w,
          decoration: BoxDecoration(
            color: withOutBackground
                ? Colors.transparent
                : AppColors.grayMediumlight,
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
            height: height ?? 75.h,
            width: width ?? 75.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              color: AppColors.loadingColor,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) => Center(
        child: Container(
          height: height ?? 75.h,
          width: width ?? 75.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            border: Border.all(color: AppColors.grayLighter, width: 3),
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
