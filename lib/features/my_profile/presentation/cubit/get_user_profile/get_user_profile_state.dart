part of 'get_user_profile_cubit.dart';

@freezed
class GetUserProfileState with _$GetUserProfileState {
  const factory GetUserProfileState.initial() = _Initial;
  const factory GetUserProfileState.loading() = _Loading;
  const factory GetUserProfileState.success(
      UserProfileResponseModel userProfile) = _Success;
  const factory GetUserProfileState.failure() = _Failure;
}
