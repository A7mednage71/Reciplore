import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/recipe_save_toggle/cubit/recipe_save_toggle_cubit.dart';
import 'package:looqma/core/common/widgets/cached_network_circle_avatar.dart';
import 'package:looqma/core/common/widgets/save_recipe_button.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/category_recipes/presentation/cubit/get_recipes_by_category/get_recipes_by_category_cubit.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/features/home/presentation/cubit/get_recipes/get_recipes_by_country/get_recipes_by_country_cubit.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({super.key, required this.recipeModel});
  final RecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 176.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: AppColors.grayLighter,
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              children: [
                SizedBox(
                  height: 66.h,
                ),
                Text(
                  recipeModel.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: AppStyles.smallBoldText,
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rate",
                          style: AppStyles.smallRegularText
                              .copyWith(color: AppColors.grayLight),
                        ),
                        Row(
                          children: [
                            Text(
                              "${recipeModel.averageRating} ",
                              style: AppStyles.smallRegularText,
                            ),
                            SizedBox(height: 5.h),
                            Image.asset(AppAssets.imagesRateStar)
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    SaveRecipeButton(
                      isSaved: (recipeModel.isFavourite ?? true),
                      onPressed: () async {
                        await updateFetchedRecipesFavoriteStatusLocally(
                            context);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: -50.h,
          right: 25.w,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.grayLight,
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: CachedNetworkCircleAvatar(
                image: recipeModel.images.urls.first.secureUrl, radius: 50.r),
          ),
        ),
      ],
    );
  }

  Future<void> updateFetchedRecipesFavoriteStatusLocally(
      BuildContext context) async {
    await context
        .read<RecipeSaveToggleCubit>()
        .toggleSave(recipeId: recipeModel.id);
    if (!context.mounted) return;
    context
        .read<GetRecipesByCountryCubit>()
        .toggleRecipeFavoriteStatus(recipeModel.id);
    context
        .read<GetRecipesByCategoryCubit>()
        .toggleRecipeFavoriteStatus(recipeModel.id);
  }
}
