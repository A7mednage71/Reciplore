import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class IngredientCachedImage extends StatelessWidget {
  const IngredientCachedImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          'https://images.unsplash.com/photo-1741439432848-ae1301dca116?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyNnx8fGVufDB8fHx8fA%3D%3D',
      imageBuilder: (context, imageProvider) {
        return Container(
          height: 110.h,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
        );
      },
      placeholder: (context, url) {
        return Skeletonizer(
          child: Container(
            height: 110.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              ),
              color: AppColors.loadingColor,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: AppColors.red,
      ),
      fit: BoxFit.fill,
    );
  }
}
