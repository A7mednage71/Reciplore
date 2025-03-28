import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/core/common/models/get_recipes_query_model.dart';
import 'package:looqma/features/home/data/models/get_recipes_response_model.dart';
import 'package:looqma/features/home/data/repos/home_repo.dart';

part 'get_recipes_by_category_cubit.freezed.dart';
part 'get_recipes_by_category_state.dart';

class GetRecipesByCategoryCubit extends Cubit<GetRecipesByCategoryState> {
  GetRecipesByCategoryCubit(this._homeRepo)
      : super(const GetRecipesByCategoryState.initial());

  final HomeRepo _homeRepo;

  List<RecipeModel> recipes = [];
  int totalRecipeslength = 0;

  String? selectedCategoryId;

  int currentPage = 1;
  bool hasNextPage = true;
  bool isFetching = false;

  Future<void> getRecipesByCategory(
      {String? categoryId, bool isRefresh = false}) async {
    if (isFetching || (!hasNextPage && !isRefresh)) return;

    if (isRefresh && categoryId != null) {
      currentPage = 1;
      totalRecipeslength = 0;
      recipes.clear();
      hasNextPage = true;
      selectedCategoryId = categoryId;
      emit(const GetRecipesByCategoryState.loading());
    }

    isFetching = true;

    final result = await _homeRepo.getRecipes(
      request: GetRecipesQueryModel(
        page: currentPage,
        limit: 10,
        category: selectedCategoryId,
      ),
    );

    result.when(
      success: (getRecipesResponseModel) {
        final newRecipes =
            getRecipesResponseModel.fetchedRecipesData.recipesList;
        totalRecipeslength =
            getRecipesResponseModel.fetchedRecipesData.recipesCount;
        hasNextPage = getRecipesResponseModel.fetchedRecipesData.hasNextPage;

        recipes.addAll(newRecipes);
        currentPage++;

        isFetching = false;
        emit(GetRecipesByCategoryState.success(List.from(recipes)));
      },
      failure: (error) {
        isFetching = false;
        emit(GetRecipesByCategoryState.failure(error.errMessages));
      },
    );
  }

  /// ✅ **NEW METHOD TO TOGGLE FAVORITE STATUS**
  void toggleRecipeFavoriteStatus(String recipeId) {
    recipes = recipes.map((recipe) {
      if (recipe.id == recipeId) {
        bool isFov = recipe.isFavourite ?? false;
        final updatedRecipe = recipe.copyWith(isFavourite: !isFov);
        return updatedRecipe;
      }
      return recipe;
    }).toList();

    emit(GetRecipesByCategoryState.success(List.from(recipes)));
  }
}
