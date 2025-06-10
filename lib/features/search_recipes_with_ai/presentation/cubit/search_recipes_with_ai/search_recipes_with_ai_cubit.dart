import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/search_recipes_with_ai/data/models/search_recipe_with_ai_request_model.dart';
import 'package:looqma/features/search_recipes_with_ai/data/models/search_recipe_with_ai_response_model.dart';
import 'package:looqma/features/search_recipes_with_ai/data/repos/search_with_ai_repo.dart';

part 'search_recipes_with_ai_state.dart';
part 'search_with_ai_cubit.freezed.dart';

class SearchRecipesWithAiCubit extends Cubit<SearchRecipesWithAiState> {
  SearchRecipesWithAiCubit(this._searchwithAiRepo)
      : super(const SearchRecipesWithAiState.initial());

  final SearchRecipesWithAiRepo _searchwithAiRepo;

  final TextEditingController searchController = TextEditingController();

  Future<void> searchWithAi() async {
    if (searchController.text.trim().isEmpty) {
      emit(const SearchRecipesWithAiState.initial());
      return;
    }
    emit(const SearchRecipesWithAiState.loading());

    final result = await _searchwithAiRepo.searchWithAi(
        requestModel: SearchRecipeWithAiRequestModel(
            ingredients: searchController.text.trim(), start: 0, count: 10));

    result.when(
      success: (data) {
        emit(SearchRecipesWithAiState.success(data.recipes));
      },
      failure: (failure) {
        emit(SearchRecipesWithAiState.failure(failure.errMessages));
      },
    );
  }
}
