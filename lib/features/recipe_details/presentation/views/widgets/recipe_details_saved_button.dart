import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looqma/core/common/recipe_save_toggle/cubit/recipe_save_toggle_cubit.dart';
import 'package:looqma/core/common/widgets/save_recipe_button.dart';
import 'package:looqma/features/category_recipes/presentation/cubit/get_recipes_by_category/get_recipes_by_category_cubit.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/features/saved_recipe/presentation/cubit/get_saved_recipes/get_saved_recipes_cubit.dart';

class RecipeDetailsSavedButton extends StatefulWidget {
  const RecipeDetailsSavedButton({
    super.key,
    required this.recipeModel,
  });

  final RecipeModel recipeModel;

  @override
  State<RecipeDetailsSavedButton> createState() =>
      _RecipeDetailsSavedButtonState();
}

class _RecipeDetailsSavedButtonState extends State<RecipeDetailsSavedButton> {
  late bool isSaved;

  @override
  void initState() {
    isSaved = widget.recipeModel.isFavourite ?? true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SaveRecipeButton(
        isSaved: isSaved,
        onPressed: () async {
          await updateFetchedRecipesFavoriteStatusLocally(context);
          setState(() => isSaved = !isSaved);
        },
      ),
    );
  }

  Future<void> updateFetchedRecipesFavoriteStatusLocally(
      BuildContext context) async {
    await context
        .read<RecipeSaveToggleCubit>()
        .toggleSave(recipeId: widget.recipeModel.id);

    if (!context.mounted) return;
    context
        .read<GetSavedRecipesCubit>()
        .removeRecipe(widget.recipeModel.id, context);
    context
        .read<GetRecipesByCategoryCubit>()
        .toggleRecipeFavoriteStatus(widget.recipeModel.id);
  }
}
