import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/core/common/widgets/custom_rate.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/saved_recipe/presentation/views/widgets/saved_recipe_details.dart';

class SavedRecipeItem extends StatelessWidget {
  const SavedRecipeItem({
    super.key,
    required this.recipeModel,
    this.isloading = false,
  });

  final RecipeModel recipeModel;
  final bool isloading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: recipeModel.images.urls.first.secureUrl,
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 500),
              placeholder: (context, url) => Container(
                color: AppColors.grayLighter,
              ),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error, color: Colors.red),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isloading
                      ? [AppColors.white, AppColors.white]
                      : [
                          Colors.transparent,
                          // ignore: deprecated_member_use
                          AppColors.black.withOpacity(0.7),
                        ],
                ),
              ),
              padding: EdgeInsets.all(10.w),
              child: Column(
                children: [
                  CustomRate(rate: recipeModel.averageRating.toString()),
                  const Spacer(),
                  SavedRecipeDetails(recipeModel: recipeModel),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
