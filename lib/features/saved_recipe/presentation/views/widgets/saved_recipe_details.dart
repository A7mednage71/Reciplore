import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/recipe_save_toggle/cubit/recipe_save_toggle_cubit.dart';
import 'package:looqma/core/common/widgets/save_recipe_button.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home/data/models/get_recipes_response_model.dart';
import 'package:looqma/features/saved_recipe/presentation/cubit/get_saved_recipes/get_saved_recipes_cubit.dart';

class SavedRecipeDetails extends StatelessWidget {
  const SavedRecipeDetails({super.key, required this.recipeModel});
  final RecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recipeModel.name,
                style: AppStyles.smallBoldText.copyWith(
                  color: AppColors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5.h),
              Text('Category',
                  style: AppStyles.smallRegularText.copyWith(
                    color: AppColors.grayLight,
                  )),
              Text(recipeModel.category?.name ?? "",
                  style: AppStyles.smallRegularText
                      .copyWith(color: AppColors.white)),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: SaveRecipeButton(
            isSaved: recipeModel.isFavourite ?? true,
            onPressed: () async {
              await context
                  .read<RecipeSaveToggleCubit>()
                  .toggleSave(recipeId: recipeModel.id);
              if (!context.mounted) return;
              context
                  .read<GetSavedRecipesCubit>()
                  .removeRecipe(recipeModel.id, context);
            },
          ),
        ),
      ],
    );
  }
}
