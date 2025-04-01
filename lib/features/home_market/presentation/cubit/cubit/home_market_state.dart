part of 'home_market_cubit.dart';

@freezed
class HomeMarketState with _$HomeMarketState {
  const factory HomeMarketState.initial() = _Initial;
  const factory HomeMarketState.loading() = _Loading;
  const factory HomeMarketState.fetchIngredientsSuccess({
    required List<IngredientDataModel> ingredients,
  }) = _FetchIngredientsSuccess;

  const factory HomeMarketState.fetchBestSellingSuccess({
    required List<IngredientDataModel> ingredients,
  }) = _FetchBestSellingSuccess;

  const factory HomeMarketState.failure({
    required String message,
  }) = _Failure;
}
