import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/home/data/models/get_recipes_request.dart';
import 'package:looqma/features/home/data/models/get_recipes_response_model.dart';
import 'package:looqma/features/home/data/repos/home_repo.dart';

part 'get_recipes_by_country_cubit.freezed.dart';
part 'get_recipes_by_country_state.dart';

class GetRecipesByCountryCubit extends Cubit<GetRecipesByCountryState> {
  GetRecipesByCountryCubit(this._homeRepo)
      : super(const GetRecipesByCountryState.initial());

  final HomeRepo _homeRepo;

  List<RecipeModel> countryRecipes = [];

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
      emit(const GetRecipesByCountryState.loading());
    }

    isFetching = true;

    final result = await _homeRepo.getRecipes(
      request: GetRecipesRequest(
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
}
