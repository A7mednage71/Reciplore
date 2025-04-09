import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';

part 'home_market_state.freezed.dart';

enum HomeMarketStatus { initial, loading, success, failure }

@freezed
class HomeMarketState with _$HomeMarketState {
  const factory HomeMarketState({
    @Default(HomeMarketStatus.initial) HomeMarketStatus status,
    @Default([]) List<IngredientDataModel> ingredients,
    @Default([]) List<IngredientDataModel> bestSellingList,
    String? message,
    @Default(1) int currentPage,
    @Default(true) bool hasNextPage,
    @Default(false) bool isFetching,
    @Default(0) int totalILength,
  }) = _HomeMarketState;
}
