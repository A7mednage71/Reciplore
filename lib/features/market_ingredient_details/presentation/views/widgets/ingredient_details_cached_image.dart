import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class IngredientDetailsCachedImage extends StatelessWidget {
  const IngredientDetailsCachedImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.45;
    return CachedNetworkImage(
      imageUrl:
          'https://res.cloudinary.com/dfdmgqhwa/image/upload/v1739636779/recipesSystem/ingredients/zxvs3jhve2pdviflgp7v.png',
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          decoration: const BoxDecoration(
            color: AppColors.primaryMedium,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primaryLighter,
                AppColors.primaryDark,
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(50.r),
              child: Image(
                image: imageProvider,
              ),
            ),
          ),
        );
      },
      placeholder: (context, url) {
        return Skeletonizer(
          child: Container(
            height: height,
            decoration: const BoxDecoration(
              color: AppColors.primaryMedium,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          height: height,
          decoration: const BoxDecoration(
            color: AppColors.primaryMedium,
          ),
          child: const Center(
            child: Icon(
              Icons.error,
              color: AppColors.red,
            ),
          ),
        );
      },
    );
  }
}
