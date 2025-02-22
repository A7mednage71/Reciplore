import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/home/data/models/get_recipes_request.dart';
import 'package:looqma/features/home/data/models/get_recipes_response_model.dart';
import 'package:looqma/features/home/data/repos/home_repo.dart';

part 'get_recipes_cubit.freezed.dart';
part 'get_recipes_state.dart';

class GetRecipesCubit extends Cubit<GetRecipesState> {
  GetRecipesCubit(this._homeRepo) : super(const GetRecipesState.initial());

  final HomeRepo _homeRepo;

  List<RecipeModel> allRecipes = [];

  String? selectedCategory;
  String? selectedCountryId;

  int currentPage = 1;
  bool hasNextPage = true;
  bool isFetching = false;

  Future<void> getRecipes({bool isRefresh = false}) async {
    if (isFetching || (!hasNextPage && !isRefresh)) return;

    if (isRefresh) {
      currentPage = 1;
      allRecipes.clear();
      hasNextPage = true;
    }

    isFetching = true;
    emit(const GetRecipesState.loading());

    final result = await _homeRepo.getRecipes(
      request: GetRecipesRequest(
        page: currentPage,
        limit: 5,
        categoryId: selectedCategory,
        countryId: selectedCountryId,
      ),
    );

    result.when(success: (getRecipesResponseModel) {
      final newRecipes = getRecipesResponseModel.fetchedRecipesData.recipesList;
      hasNextPage = getRecipesResponseModel.fetchedRecipesData.hasNextPage;

      if (isRefresh) {
        allRecipes = newRecipes;
      } else {
        allRecipes.addAll(newRecipes);
        currentPage++;
      }

      isFetching = false;
      emit(GetRecipesState.success(allRecipes));
    }, failure: (error) {
      isFetching = false;
      emit(GetRecipesState.failure(error.errMessages));
    });
  }

  void changeCountry(String? countryId) {
    if (selectedCountryId != countryId) {
      selectedCountryId = countryId;
      getRecipes(isRefresh: true);
    }
  }

  void changeCategory(String? categoryId) {
    if (selectedCategory != categoryId) {
      selectedCategory = categoryId;
      getRecipes(isRefresh: true);
    }
  }
}
