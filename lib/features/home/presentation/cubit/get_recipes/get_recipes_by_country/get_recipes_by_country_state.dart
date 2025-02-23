part of 'get_recipes_by_country_cubit.dart';

@freezed
class GetRecipesByCountryState with _$GetRecipesByCountryState {
  const factory GetRecipesByCountryState.initial() = _Initial;
  const factory GetRecipesByCountryState.loading() = _Loading;
  const factory GetRecipesByCountryState.success(List<RecipeModel> recipes) =
      _Success;
  const factory GetRecipesByCountryState.failure(String message) = _Failure;
}
