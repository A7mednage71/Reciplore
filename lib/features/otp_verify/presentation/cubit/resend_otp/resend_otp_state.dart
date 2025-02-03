part of 'resend_otp_cubit.dart';

@freezed
class ResendOtpState with _$ResendOtpState {
  const factory ResendOtpState.initial() = _Initial;
  const factory ResendOtpState.loading() = _Loading;
  const factory ResendOtpState.success(String successMessage) = _Success;
  const factory ResendOtpState.failure(String errorMessage) = _Failure;
}
