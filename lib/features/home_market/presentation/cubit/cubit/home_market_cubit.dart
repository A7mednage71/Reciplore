import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looqma/core/common/models/get_ingredients_query_model.dart';
import 'package:looqma/features/home_market/data/repos/home_market_repo.dart';
import 'package:looqma/features/home_market/presentation/cubit/cubit/home_market_state.dart';

class HomeMarketCubit extends Cubit<HomeMarketState> {
  HomeMarketCubit(this._homeMarketRepo) : super(const HomeMarketState());

  final HomeMarketRepo _homeMarketRepo;

  Future<void> getMarketBanners() async {
    emit(state.copyWith(status: HomeMarketStatus.loading));

    final result = await _homeMarketRepo.getMarketBanners();

    result.when(
      success: (successResponse) {
        emit(state.copyWith(
          status: HomeMarketStatus.success,
          marketBanners: successResponse.banners,
        ));
      },
      failure: (failureResponse) {
        emit(state.copyWith(
          status: HomeMarketStatus.failure,
          message: failureResponse.errMessages,
        ));
      },
    );
  }

  Future<void> getIngredients({bool isRefresh = false}) async {
    if (state.isFetching || (!state.hasNextPage && !isRefresh)) return;

    if (isRefresh) {
      emit(state.copyWith(
        ingredients: [],
        currentPage: 1,
        hasNextPage: true,
        totalILength: 0,
        isFetching: false,
        status: HomeMarketStatus.loading,
      ));
    }

    emit(state.copyWith(isFetching: true));

    final result = await _homeMarketRepo.getIngredients(
      query: GetIngredientsQueryModel(page: state.currentPage, limit: 10),
    );

    result.when(
      success: (ingredientsResponseModel) {
        final newIngredients =
            ingredientsResponseModel.ingredients.ingredientsList;
        final hasNextPage = ingredientsResponseModel.ingredients.hasNextPage;
        final totalILength =
            ingredientsResponseModel.ingredients.ingredientsCount;

        final updatedIngredients = [
          ...state.ingredients,
          ...newIngredients,
        ];

        emit(state.copyWith(
          status: HomeMarketStatus.success,
          ingredients: updatedIngredients,
          hasNextPage: hasNextPage,
          isFetching: false,
          totalILength: totalILength,
          currentPage: state.currentPage + 1,
        ));
      },
      failure: (failure) {
        emit(state.copyWith(
            status: HomeMarketStatus.failure,
            message: failure.errMessages,
            isFetching: false));
      },
    );
  }

  Future<void> getBestSellingIngredients() async {
    emit(state.copyWith(status: HomeMarketStatus.loading));

    final result = await _homeMarketRepo.getIngredients(
      query: GetIngredientsQueryModel(page: 1, limit: 10, sort: '-sellings'),
    );

    result.when(
      success: (ingredientsResponseModel) {
        final bestSellingList =
            ingredientsResponseModel.ingredients.ingredientsList;

        emit(state.copyWith(
            status: HomeMarketStatus.success,
            bestSellingList: bestSellingList));
      },
      failure: (failure) {
        emit(state.copyWith(
            status: HomeMarketStatus.failure, message: failure.errMessages));
      },
    );
  }

  // toggle incart status
  void toggleInCartStatus(String id) {
    if (state.ingredients.isEmpty && state.bestSellingList.isEmpty) return;

    // Check if the item exists in either list
    final ingredientIndex =
        state.ingredients.indexWhere((ingredient) => ingredient.id == id);
    final bestSellingIndex =
        state.bestSellingList.indexWhere((ingredient) => ingredient.id == id);

    // Not found anywhere, so do nothing
    if (ingredientIndex == -1 && bestSellingIndex == -1) {
      return;
    }

    final updatedIngredients = state.ingredients.map((ingredient) {
      if (ingredient.id == id) {
        return ingredient.copyWith(inCart: !ingredient.inCart!);
      }
      return ingredient;
    }).toList();

    final updatedBestSellingList = state.bestSellingList.map((ingredient) {
      if (ingredient.id == id) {
        return ingredient.copyWith(inCart: !ingredient.inCart!);
      }
      return ingredient;
    }).toList();

    // toggle
    emit(state.copyWith(
      ingredients: updatedIngredients,
      bestSellingList: updatedBestSellingList,
      status: HomeMarketStatus.success,
    ));
  }

  void removeAllfromCart() {
    emit(state.copyWith(
      ingredients: state.ingredients.map((ingredient) {
        if (ingredient.inCart!) {
          return ingredient.copyWith(inCart: false);
        }
        return ingredient;
      }).toList(),
      bestSellingList: state.bestSellingList.map((ingredient) {
        if (ingredient.inCart!) {
          return ingredient.copyWith(inCart: false);
        }
        return ingredient;
      }).toList(),
    ));
  }
}
