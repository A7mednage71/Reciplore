import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/core/common/models/get_recipes_query_model.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/features/home/data/repos/home_repo.dart';

part 'get_recipes_by_country_cubit.freezed.dart';
part 'get_recipes_by_country_state.dart';

class GetRecipesByCountryCubit extends Cubit<GetRecipesByCountryState> {
  GetRecipesByCountryCubit(this._homeRepo)
      : super(const GetRecipesByCountryState.initial());

  final HomeRepo _homeRepo;

  List<RecipeModel> countryRecipes = [];
  int totalRecipesLength = 0;

  String? selectedCountryId;

  int currentPage = 1;
  bool hasNextPage = true;
  bool isFetching = false;

  Future<void> getRecipesByCountry(
      {String? countryId, bool isRefresh = false}) async {
    if (isFetching || (!hasNextPage && !isRefresh)) return;

    if (isRefresh || selectedCountryId != countryId) {
      currentPage = 1;
      countryRecipes.clear();
      hasNextPage = true;
      selectedCountryId = countryId;
      totalRecipesLength = 0;
      emit(const GetRecipesByCountryState.loading());
    }

    isFetching = true;

    final result = await _homeRepo.getRecipes(
      request: GetRecipesQueryModel(
        page: currentPage,
        limit: 5,
        country: selectedCountryId,
      ),
    );

    result.when(
      success: (getRecipesResponseModel) {
        final newRecipes =
            getRecipesResponseModel.fetchedRecipesData.recipesList;
        hasNextPage = getRecipesResponseModel.fetchedRecipesData.hasNextPage;
        totalRecipesLength =
            getRecipesResponseModel.fetchedRecipesData.recipesCount;

        countryRecipes.addAll(newRecipes);
        currentPage++;

        isFetching = false;
        emit(GetRecipesByCountryState.success(List.from(countryRecipes)));
      },
      failure: (error) {
        isFetching = false;
        emit(GetRecipesByCountryState.failure(error.errMessages));
      },
    );
  }

  /// ✅ **NEW METHOD TO TOGGLE FAVORITE STATUS**
  void toggleRecipeFavoriteStatus(String recipeId) {
    countryRecipes = countryRecipes.map((recipe) {
      if (recipe.id == recipeId) {
        bool isFov = recipe.isFavourite ?? false;
        final updatedRecipe = recipe.copyWith(isFavourite: !isFov);
        return updatedRecipe;
      }
      return recipe;
    }).toList();

    emit(GetRecipesByCountryState.success(List.from(countryRecipes)));
  }
}
