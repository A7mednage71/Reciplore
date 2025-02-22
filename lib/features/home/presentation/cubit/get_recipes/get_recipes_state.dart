part of 'get_recipes_cubit.dart';

@freezed
class GetRecipesState with _$GetRecipesState {
  const factory GetRecipesState.initial() = _Initial;
  const factory GetRecipesState.loading() = _Loading;
  const factory GetRecipesState.success(List<RecipeModel> recipes) = _Success;
  const factory GetRecipesState.failure(String message) = _Failure;
}
