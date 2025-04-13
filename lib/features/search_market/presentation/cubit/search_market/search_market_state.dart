part of 'search_market_cubit.dart';

enum SearchMarketStatus { initial, loading, success, failure }

@freezed
class SearchMarketState with _$SearchMarketState {
  const factory SearchMarketState({
    @Default(SearchMarketStatus.initial) SearchMarketStatus status,
    @Default([]) List<IngredientDataModel> ingredients,
    String? message,
    @Default(1) int currentPage,
    @Default(true) bool hasNextPage,
    @Default(false) bool isFetching,
    @Default(0) int totalILength,
  }) = _SearchMarketState;
}
