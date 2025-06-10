part of 'change_password_cubit.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState.initial() = _Initial;
  const factory ChangePasswordState.loading() = _Loading;
  const factory ChangePasswordState.success({required String message}) =
      _Success;
  const factory ChangePasswordState.failure({required String errMessage}) =
      _Failure;
}
