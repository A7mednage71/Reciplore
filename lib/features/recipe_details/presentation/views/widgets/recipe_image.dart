import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_rate.dart';
import 'package:looqma/core/common/widgets/save_recipe_button.dart';
import 'package:looqma/features/home/data/models/get_recipes_response_model.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/watch_video_button.dart';

class RecipeImage extends StatelessWidget {
  const RecipeImage({
    super.key,
    required this.recipeModel,
  });
  final RecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              recipeModel.images.urls.first.secureUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomRate(rate: recipeModel.averageRating.toString()),
              SizedBox(height: 10.h),
              WatchVideoButton(recipeModel: recipeModel),
              Align(
                alignment: Alignment.bottomRight,
                child: SaveRecipeButton(
                  recipeModel: recipeModel,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
