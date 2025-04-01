import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/core/common/models/get_ingredients_query_model.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';
import 'package:looqma/features/home_market/data/repos/home_market_repo.dart';

part 'home_market_cubit.freezed.dart';
part 'home_market_state.dart';

class HomeMarketCubit extends Cubit<HomeMarketState> {
  HomeMarketCubit(this._homeMarketRepo)
      : super(const HomeMarketState.initial());

  final HomeMarketRepo _homeMarketRepo;

  List<IngredientDataModel> ingredientsList = [];
  int totalILength = 0;

  int currentPage = 1;
  bool hasNextPage = true;
  bool isFetching = false;

  Future<void> getIngredients({bool isRefresh = false}) async {
    if (isFetching || (!hasNextPage && !isRefresh)) return;

    if (isRefresh) {
      currentPage = 1;
      ingredientsList.clear();
      hasNextPage = true;
      totalILength = 0;
      emit(const HomeMarketState.loading());
    }

    isFetching = true;

    final result = await _homeMarketRepo.getIngredients(
      query: GetIngredientsQueryModel(page: currentPage, limit: 10),
    );

    result.when(
      success: (ingredientsResponseModel) {
        final newIngredients =
            ingredientsResponseModel.ingredients.ingredientsList;
        hasNextPage = ingredientsResponseModel.ingredients.hasNextPage;
        totalILength = ingredientsResponseModel.ingredients.ingredientsCount;

        ingredientsList.addAll(newIngredients);
        currentPage++;
        isFetching = false;

        emit(HomeMarketState.fetchIngredientsSuccess(
            ingredients: List.from(ingredientsList)));
      },
      failure: (failure) {
        emit(HomeMarketState.failure(message: failure.errMessages));
      },
    );
  }
}
