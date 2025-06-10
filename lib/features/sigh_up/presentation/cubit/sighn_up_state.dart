part of 'sighn_up_cubit.dart';

@freezed
class SighnUpState with _$SighnUpState {
  const factory SighnUpState.initial() = _Initial;
  const factory SighnUpState.loading() = _Loading;
  const factory SighnUpState.success(String successMessage) = _Success;
  const factory SighnUpState.failure(String errorMessage) = _Error;
}
