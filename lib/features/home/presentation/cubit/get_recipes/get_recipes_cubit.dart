import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/home/data/models/get_recipes_response_model.dart';
import 'package:looqma/features/home/data/models/get_recipes_request.dart';
import 'package:looqma/features/home/data/repos/home_repo.dart';

part 'get_recipes_cubit.freezed.dart';
part 'get_recipes_state.dart';

class GetRecipesCubit extends Cubit<GetRecipesState> {
  GetRecipesCubit(this._homeRepo) : super(const GetRecipesState.initial());

  final HomeRepo _homeRepo;
  Future<void> getRecipes() async {
    emit(const GetRecipesState.loading());

    final result = await _homeRepo.getRecipes(
      request: GetRecipesRequest(
        page: 1,
        limit: 10,
        categoryId: '1',
        countryId: '1',
      ),
    );

    result.when(success: (getRecipesResponseModel) {
      emit(GetRecipesState.success(getRecipesResponseModel.fetchedRecipesData));
    }, failure: (error) {
      emit(GetRecipesState.failure(error.errMessages));
    });
  }
}
