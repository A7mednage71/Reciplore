part of 'checkout_cubit.dart';

enum CheckoutStatus { initial, loading, success, failure }

enum AddressActionStatus { initial, loading, success, failure }

enum AddressActionType { none, add, update, delete }

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    @Default(CheckoutStatus.initial) CheckoutStatus status,
    CartOverviewResponseModel? cartOverview,
    String? message,
    @Default(AddressActionStatus.initial)
    AddressActionStatus addressActionStatus,
    @Default(AddressActionType.none) AddressActionType addressActionType,
    String? addressActionMessage,
  }) = _CheckoutState;
}
