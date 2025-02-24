import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  TextEditingController searchController = TextEditingController();

  List<RecipeModel> recipes = [];

  Future<void> searchRecipes({bool isNewSearch = false}) async {
    if (isFetching || !hasNextPage) return;

    isFetching = true;

    if (isNewSearch) {
      currentPage = 1;
      hasNextPage = true;
      recipes.clear();
      emit(const SearchRecipeState.loading());
    }

    final result = await _searchRepo.searchRecipes(
      request: GetRecipesRequest(
        page: 1,
        search: searchController.text,
      ),
    );

    result.when(
      success: (getRecipesResponseModel) {
        final newRecipes =
            getRecipesResponseModel.fetchedRecipesData.recipesList;
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
}
