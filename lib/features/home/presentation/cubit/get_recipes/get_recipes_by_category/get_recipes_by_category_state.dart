part of 'get_recipes_by_category_cubit.dart';

@freezed
class GetRecipesByCategoryState with _$GetRecipesByCategoryState {
  const factory GetRecipesByCategoryState.initial() = _Initial;
  const factory GetRecipesByCategoryState.loading() = _Loading;
  const factory GetRecipesByCategoryState.success(List<RecipeModel> recipes) =
      _Success;
  const factory GetRecipesByCategoryState.failure(String message) = _Failure;
}
