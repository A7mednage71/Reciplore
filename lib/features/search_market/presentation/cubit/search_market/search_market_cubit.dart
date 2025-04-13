import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/core/common/models/get_ingredients_query_model.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';
import 'package:looqma/features/search_market/data/repos/search_market_repo.dart';

part 'search_market_cubit.freezed.dart';
part 'search_market_state.dart';

class SearchMarketCubit extends Cubit<SearchMarketState> {
  SearchMarketCubit(this._searchMarketRepo) : super(const SearchMarketState());

  final SearchMarketRepo _searchMarketRepo;

  TextEditingController searchController = TextEditingController();

  final Debouncer debouncer = Debouncer();

  /// Debounced new Search Function
  Future<void> onSearchChanged() async {
    debouncer.debounce(
      duration: const Duration(milliseconds: 500),
      onDebounce: () async {
        if (searchController.text.trim().isEmpty) {
          emit(const SearchMarketState());
        } else {
          await searchIngredients(isRefresh: true);
        }
      },
    );
  }

  Future<void> searchIngredients({bool isRefresh = false}) async {
    if (state.isFetching || (!state.hasNextPage && !isRefresh)) return;

    if (isRefresh) {
      emit(state.copyWith(
        ingredients: [],
        currentPage: 1,
        hasNextPage: true,
        totalILength: 0,
        isFetching: false,
        status: SearchMarketStatus.loading,
      ));
    }

    emit(state.copyWith(isFetching: true));

    final result = await _searchMarketRepo.searchIngredients(
      query: GetIngredientsQueryModel(
        page: state.currentPage,
        search: searchController.text.trim(),
        maxPrice: state.maxPrice,
        minPrice: state.minPrice,
        rate: state.rate,
        sort: state.sort,
      ),
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
          status: SearchMarketStatus.success,
          ingredients: updatedIngredients,
          hasNextPage: hasNextPage,
          isFetching: false,
          totalILength: totalILength,
          currentPage: state.currentPage + 1,
        ));
      },
      failure: (failure) {
        emit(state.copyWith(
            status: SearchMarketStatus.failure,
            message: failure.errMessages,
            isFetching: false));
      },
    );
  }

  /// Apply All Filters
  void applyFilters({
    required String minPrice,
    required String maxPrice,
    String? sort,
    String? rate,
    bool triggerSearch = true,
  }) {
    emit(state.copyWith(
      minPrice: minPrice,
      maxPrice: maxPrice,
      sort: sort ?? '',
      rate: rate ?? '0',
      status: SearchMarketStatus.initial,
    ));
    if (triggerSearch) {
      searchIngredients(isRefresh: true);
    }
  }

  /// Reset Filters
  void resetFilters() {
    emit(const SearchMarketState());
    if (searchController.text.trim().isNotEmpty) {
      searchIngredients(isRefresh: true);
    }
  }
}
