part of 'search_recipe_cubit.dart';

@freezed
class SearchRecipeState with _$SearchRecipeState {
  const factory SearchRecipeState.initial() = _Initial;
  const factory SearchRecipeState.loading() = _Loading;
  const factory SearchRecipeState.success(
      {required List<RecipeModel> recipes}) = _Success;
  const factory SearchRecipeState.failure({required String message}) = _Failure;
}
