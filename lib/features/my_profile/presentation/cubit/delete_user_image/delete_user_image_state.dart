part of 'delete_user_image_cubit.dart';

@freezed
class DeleteUserImageState with _$DeleteUserImageState {
  const factory DeleteUserImageState.initial() = _Initial;
    const factory DeleteUserImageState.loading() = _Loading;
  const factory DeleteUserImageState.success({required String successMessage}) =
      _Success;
  const factory DeleteUserImageState.failure({required String errMessage}) =
      _Failure;
}
