import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/core/common/recipe_save_toggle/repos/recipe_save_toggle_repo.dart';

part 'recipe_save_toggle_cubit.freezed.dart';
part 'recipe_save_toggle_state.dart';

class RecipeSaveToggleCubit extends Cubit<RecipeSaveToggleState> {
  RecipeSaveToggleCubit(this.recipeSaveToggleRepo)
      : super(const RecipeSaveToggleState.initial());

  final RecipeSaveToggleRepo recipeSaveToggleRepo;

  Future<void> toggleSave({required String recipeId}) async {
    final result =
        await recipeSaveToggleRepo.recipeSaveToggle(recipeId: recipeId);

    result.when(
      success: (successResponse) {
        return emit(
            RecipeSaveToggleState.success(message: successResponse.message));
      },
      failure: (failureResponse) {
        return emit(RecipeSaveToggleState.failure(
            message: failureResponse.errMessages));
      },
    );
  }
}
