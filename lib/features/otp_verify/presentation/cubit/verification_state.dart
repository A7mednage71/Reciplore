part of 'verification_cubit.dart';

@freezed
class VerificationState with _$VerificationState {
  const factory VerificationState.initial() = _Initial;
  const factory VerificationState.loading() = _Loading;
  const factory VerificationState.success(String successMessage) = _Success;
  const factory VerificationState.failure(String errorMessage) = _Failure;
}
