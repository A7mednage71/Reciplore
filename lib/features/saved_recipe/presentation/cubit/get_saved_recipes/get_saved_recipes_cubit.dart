import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/home/data/models/get_recipes_response_model.dart';
import 'package:looqma/features/saved_recipe/data/repos/saved_recipes_repo.dart';

part 'get_saved_recipes_cubit.freezed.dart';
part 'get_saved_recipes_state.dart';

class GetSavedRecipesCubit extends Cubit<GetSavedRecipesState> {
  GetSavedRecipesCubit(this._savedRecipesRepo)
      : super(const GetSavedRecipesState.initial());
  final SavedRecipesRepo _savedRecipesRepo;

  Future<void> getSavedRecipes() async {
    emit(const GetSavedRecipesState.loading());
    final result = await _savedRecipesRepo.getSavedRecipes();
    result.when(
      success: (recipes) {
        return emit(
            GetSavedRecipesState.success(savedRecipes: recipes.fetchedRecipesData.recipesList));
      },
      failure: (failureResponse) {
        return emit(
            GetSavedRecipesState.failure(message: failureResponse.errMessages));
      },
    );
  }
}
