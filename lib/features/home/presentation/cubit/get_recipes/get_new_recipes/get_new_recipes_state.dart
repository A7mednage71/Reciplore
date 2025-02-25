part of 'get_new_recipes_cubit.dart';

@freezed
class GetNewRecipesState with _$GetNewRecipesState {
  const factory GetNewRecipesState.initial() = _Initial;
  const factory GetNewRecipesState.loading() = _Loading;
  const factory GetNewRecipesState.success(List<RecipeModel> recipes) =
      _Success;
  const factory GetNewRecipesState.failure(String message) = _Failure;
}
