part of 'get_saved_recipes_cubit.dart';

@freezed
class GetSavedRecipesState with _$GetSavedRecipesState {
  const factory GetSavedRecipesState.initial() = _Initial;
  const factory GetSavedRecipesState.loading() = _Loading;
  const factory GetSavedRecipesState.success({
    required List<RecipeModel> savedRecipes,
  }) = _Success;
  const factory GetSavedRecipesState.failure({required String message}) =
      _Failure;
}
