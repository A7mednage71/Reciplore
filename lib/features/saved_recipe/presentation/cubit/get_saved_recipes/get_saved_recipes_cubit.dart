import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/features/home/presentation/cubit/get_recipes/get_new_recipes/get_new_recipes_cubit.dart';
import 'package:looqma/features/home/presentation/cubit/get_recipes/get_recipes_by_country/get_recipes_by_country_cubit.dart';
import 'package:looqma/features/saved_recipe/data/repos/saved_recipes_repo.dart';

part 'get_saved_recipes_cubit.freezed.dart';
part 'get_saved_recipes_state.dart';

class GetSavedRecipesCubit extends Cubit<GetSavedRecipesState> {
  GetSavedRecipesCubit(this._savedRecipesRepo)
      : super(const GetSavedRecipesState.initial());
  final SavedRecipesRepo _savedRecipesRepo;

  List<RecipeModel> recipesList = [];

  Future<void> getSavedRecipes() async {
    emit(const GetSavedRecipesState.loading());
    final result = await _savedRecipesRepo.getSavedRecipes();
    result.when(
      success: (recipes) {
        recipesList = recipes.fetchedRecipesData.recipesList;
        return emit(GetSavedRecipesState.success(savedRecipes: recipesList));
      },
      failure: (failureResponse) {
        return emit(
            GetSavedRecipesState.failure(message: failureResponse.errMessages));
      },
    );
  }

  /// ✅ **Remove Recipe from List**
  void removeRecipe(String recipeId, BuildContext context) {
    final updatedList = List.of(recipesList)
      ..removeWhere((recipe) => recipe.id == recipeId);
    recipesList = updatedList;
    context
        .read<GetRecipesByCountryCubit>()
        .toggleRecipeFavoriteStatus(recipeId);
    context.read<GetNewRecipesCubit>().toggleRecipeFavoriteStatus(recipeId);
    emit(GetSavedRecipesState.success(savedRecipes: List.from(recipesList)));
  }
}
