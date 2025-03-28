import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/core/common/models/get_recipes_query_model.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/features/home/data/models/get_recipes_response_model.dart';
import 'package:looqma/features/search_recipes/data/repos/search_repo.dart';

part 'search_recipe_cubit.freezed.dart';
part 'search_recipe_state.dart';

class SearchRecipeCubit extends Cubit<SearchRecipeState> {
  SearchRecipeCubit(this._searchRepo)
      : super(const SearchRecipeState.initial());
  final SearchRepo _searchRepo;

  static SearchRecipeCubit get(context) => context.read<SearchRecipeCubit>();

  int currentPage = 1;
  bool hasNextPage = true;
  bool isFetching = false;
  int totalRecipesLength = 0;

  String selectedRate = "0";
  String? selectedCategoryId;
  String? selectedCountryId;

  TextEditingController searchController = TextEditingController();

  List<RecipeModel> recipes = [];

  final Debouncer debouncer = Debouncer();

  /// Debounced new Search Function
  Future<void> onSearchChanged() async {
    debouncer.debounce(
      duration: const Duration(milliseconds: 500),
      onDebounce: () async {
        if (searchController.text.trim().isEmpty) {
          currentPage = 1;
          totalRecipesLength = 0;
          hasNextPage = true;
          recipes.clear();
          emit(const SearchRecipeState.initial());
        } else {
          await searchRecipes(isNewSearch: true);
        }
      },
    );
  }

  /// Search Recipes with Pagination
  Future<void> searchRecipes({bool isNewSearch = false}) async {
    if (isFetching || (!hasNextPage && !isNewSearch)) return;

    isFetching = true;

    if (isNewSearch) {
      currentPage = 1;
      totalRecipesLength = 0;
      hasNextPage = true;
      recipes.clear();
      emit(const SearchRecipeState.loading());
    }

    // rate,category and country are used
    // to filter search results

    final result = await _searchRepo.searchRecipes(
      request: GetRecipesQueryModel(
        page: currentPage,
        search: searchController.text.trim(),
        rate: selectedRate,
        category: selectedCategoryId,
        country: selectedCountryId,
      ),
    );

    result.when(
      success: (getRecipesResponseModel) {
        final newRecipes =
            getRecipesResponseModel.fetchedRecipesData.recipesList;

        totalRecipesLength =
            getRecipesResponseModel.fetchedRecipesData.recipesCount;
        hasNextPage = getRecipesResponseModel.fetchedRecipesData.hasNextPage;

        recipes.addAll(newRecipes);
        currentPage++;
        isFetching = false;

        emit(SearchRecipeState.success(recipes: List.from(recipes)));
      },
      failure: (failureResponse) {
        isFetching = false;
        emit(SearchRecipeState.failure(message: failureResponse.errMessages));
      },
    );
  }

  Future<void> applyFilter() async {
    final searchText = searchController.text.trim();
    log("searchText: $searchText");
    if (searchText.isEmpty) {
      selectedCategoryId = null;
      selectedCountryId = null;
      selectedRate = "0";
      ShowToast.showFailureToast('Please enter a search term first');
      return;
    }
    if (selectedCategoryId != null ||
        selectedCountryId != null ||
        selectedRate != "0") {
      await searchRecipes(isNewSearch: true);
    } else {
      ShowToast.showFailureToast('Please select at least one filter');
    }
  }

  Future<void> resetFilters() async {
    if (selectedRate == "0" &&
        selectedCategoryId == null &&
        selectedCountryId == null) return;
    selectedRate = "0";
    selectedCategoryId = null;
    selectedCountryId = null;
    await onSearchChanged();
  }
}
