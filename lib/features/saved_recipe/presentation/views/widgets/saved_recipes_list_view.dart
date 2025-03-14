import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/features/home/data/models/get_recipes_response_model.dart';
import 'package:looqma/features/saved_recipe/presentation/cubit/get_saved_recipes/get_saved_recipes_cubit.dart';
import 'package:looqma/features/saved_recipe/presentation/views/widgets/saved_recipe_item.dart';

class SavedRecipesListView extends StatelessWidget {
  const SavedRecipesListView({
    super.key,
    required this.savedRecipes,
  });
  final List<RecipeModel> savedRecipes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<GetSavedRecipesCubit>().getSavedRecipes();
        },
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 15.h),
          itemCount: savedRecipes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).pushNamed(
                    Routes.showRecipeDetails,
                    arguments: savedRecipes[index]);
              },
              child: Padding(
                padding: EdgeInsets.only(top: index == 0 ? 0 : 15.h),
                child: SavedRecipeItem(recipeModel: savedRecipes[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
