import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';
import 'package:looqma/features/home_market/data/models/market_banners_reponse_model.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_banners.dart';

part 'home_market_state.freezed.dart';

enum HomeMarketStatus { initial, loading, success, failure }

@freezed
class HomeMarketState with _$HomeMarketState {
  const factory HomeMarketState({
    @Default(HomeMarketStatus.initial) HomeMarketStatus status,
    @Default([]) List<IngredientDataModel> ingredients,
    @Default([]) List<IngredientDataModel> bestSellingList,
    MarketBannersModel? marketBanners,
    String? message,
    @Default(1) int currentPage,
    @Default(true) bool hasNextPage,
    @Default(false) bool isFetching,
    @Default(0) int totalILength,
  }) = _HomeMarketState;
}
