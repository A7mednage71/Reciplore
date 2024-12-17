part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.error(String errorMessage) = _Error;
  const factory LoginState.success(String successMessage) = _Success;
}
