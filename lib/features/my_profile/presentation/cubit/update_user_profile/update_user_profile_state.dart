part of 'update_user_profile_cubit.dart';

@freezed
class UpdateUserProfileState with _$UpdateUserProfileState {
  const factory UpdateUserProfileState.initial() = _Initial;
  const factory UpdateUserProfileState.loading() = _Loading;
  const factory UpdateUserProfileState.success({required String message}) =
      _Success;
  const factory UpdateUserProfileState.failure({required String message}) =
      _Failure;
}
