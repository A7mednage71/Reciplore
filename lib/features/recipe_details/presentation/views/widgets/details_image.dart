import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/recipe_rating.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/saved_recipe_button.dart';

class DetailsImage extends StatelessWidget {
  const DetailsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          image: const DecorationImage(
            image: AssetImage(AppAssets.recipeDetails),
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
                Colors.black.withValues(alpha: 0.7),
              ],
            ),
          ),
          padding: EdgeInsets.all(10.w),
          child: Column(
            children: [
              RecipeRating(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SavedRecipeButton()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
