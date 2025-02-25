import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/home/data/models/get_recipes_request.dart';
import 'package:looqma/features/home/data/models/get_recipes_response_model.dart';
import 'package:looqma/features/home/data/repos/home_repo.dart';

part 'get_new_recipes_cubit.freezed.dart';
part 'get_new_recipes_state.dart';

class GetNewRecipesCubit extends Cubit<GetNewRecipesState> {
  GetNewRecipesCubit(this._homeRepo)
      : super(const GetNewRecipesState.initial());

  final HomeRepo _homeRepo;

  List<RecipeModel> recipes = [];
  int totalRecipesLength = 0;

  int currentPage = 1;
  bool hasNextPage = true;
  bool isFetching = false;

  Future<void> getNewRecipes({bool isRefresh = false}) async {
    if (isFetching || (!hasNextPage && !isRefresh)) return;

    if (isRefresh) {
      currentPage = 1;
      hasNextPage = true;
      totalRecipesLength = 0;
      recipes.clear();
      emit(const GetNewRecipesState.loading());
    }

    isFetching = true;

    final result = await _homeRepo.getRecipes(
      request: GetRecipesRequest(
        page: currentPage,
        limit: 5,
        sort: "-createdAt",
      ),
    );

    result.when(
      success: (getRecipesResponseModel) {
        final newRecipes =
            getRecipesResponseModel.fetchedRecipesData.recipesList;
        hasNextPage = getRecipesResponseModel.fetchedRecipesData.hasNextPage;
        totalRecipesLength =
            getRecipesResponseModel.fetchedRecipesData.recipesCount;

        recipes.addAll(newRecipes);
        currentPage++;
        
        isFetching = false;
        emit(GetNewRecipesState.success(List.from(recipes)));
      },
      failure: (error) {
        isFetching = false;
        emit(GetNewRecipesState.failure(error.errMessages));
      },
    );
  }
}
