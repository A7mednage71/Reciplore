part of 'search_recipes_with_ai_cubit.dart';

@freezed
class SearchRecipesWithAiState with _$SearchWithAiState {
  const factory SearchRecipesWithAiState.initial() = _Initial;
  const factory SearchRecipesWithAiState.loading() = _Loading;
  const factory SearchRecipesWithAiState.failure(String failure) = _Failure;
  const factory SearchRecipesWithAiState.success(List<EnhancedRecipe> recipes) =
      _Success;
}
