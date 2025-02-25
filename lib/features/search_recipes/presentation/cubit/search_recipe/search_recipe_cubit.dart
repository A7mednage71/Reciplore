import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/home/data/models/get_recipes_request.dart';
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

  TextEditingController searchController = TextEditingController();

  List<RecipeModel> recipes = [];

  final Debouncer debouncer = Debouncer();

  /// Debounced new Search Function
  void onSearchChanged() {
    debouncer.debounce(
      duration: const Duration(milliseconds: 500),
      onDebounce: () {
        if (searchController.text.trim().isEmpty) {
          currentPage = 1;
          totalRecipesLength = 0;
          hasNextPage = true;
          recipes.clear();
          emit(const SearchRecipeState.initial());
        } else {
          searchRecipes(isNewSearch: true);
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

    final result = await _searchRepo.searchRecipes(
      request: GetRecipesRequest(
        page: currentPage,
        search: searchController.text.trim(),
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

  @override
  Future<void> close() {
    debouncer.cancel();
    searchController.dispose();
    return super.close();
  }
}
