part of 'recipe_save_toggle_cubit.dart';

@freezed
class RecipeSaveToggleState with _$RecipeSaveToggleState {
  const factory RecipeSaveToggleState.initial() = _Initial;
  const factory RecipeSaveToggleState.success({required String message}) =
      _Success;
  const factory RecipeSaveToggleState.failure({required String message}) =
      _Failure;
}
