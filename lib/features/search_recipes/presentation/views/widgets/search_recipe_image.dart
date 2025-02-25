import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_constants.dart';
import 'package:looqma/features/home/data/models/get_recipes_response_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchRecipeImage extends StatelessWidget {
  const SearchRecipeImage({
    super.key,
    required this.recipeModel,
  });

  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: recipeModel.images.urls.first.secureUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: 150.w,
          height: 150.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      fit: BoxFit.cover,
      errorWidget: (context, url, error) {
        return Container(
          width: 150.w,
          height: 150.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: const DecorationImage(
              image: CachedNetworkImageProvider(
                  AppConstants.defaultRecipeItemImage),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      placeholder: (context, url) {
        return Skeletonizer(
          enabled: true,
          child: Container(
            width: 150.w,
            height: 150.h,
            decoration: BoxDecoration(
              color: AppColors.loadingColor,
              borderRadius: BorderRadius.circular(10.r),
              image: const DecorationImage(
                image: CachedNetworkImageProvider(
                    AppConstants.defaultRecipeItemImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
